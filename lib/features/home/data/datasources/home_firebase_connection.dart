import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_butterfly/logger.dart';

import '../../../../core/constants/enums/firebase_keys_enum.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/resources/fire_store_connection.dart';
import '../../../../core/utils/models/post_model.dart';

class HomeFirebaseConnection extends FireBaseConnection {
  Future<DataState<List<PostModel>>> fetchPostData(
      List<PostModel> fetchedPostList) async {
    // logger.i(fetchedPostList);
    List<PostModel> postList = [];
    try {
      final QuerySnapshot<Map<String, dynamic>> query =
          await _getOrderedQuery();

      QueryDocumentSnapshot<Map<String, dynamic>> postDoc =
          _getRangeListOfDocs(index: fetchedPostList.length, query: query);

      postList = await _createPostList(postList, postDoc);

      return DataSuccess(postList);
    } on RangeError {
      return DataSuccess(null);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> _getOrderedQuery() async {
    final QuerySnapshot<Map<String, dynamic>> query = await postsCollection()
        .orderBy(FirebaseKeysEnum.createdDate.name, descending: true)
        .get();
    return query;
  }

  QueryDocumentSnapshot<Map<String, dynamic>> _getRangeListOfDocs({
    required int index,
    required QuerySnapshot<Map<String, dynamic>> query,
  }) {
    logger.i(index);
    List<QueryDocumentSnapshot<Map<String, dynamic>>> listOfPostDocs =
        query.docs;

    return listOfPostDocs[index];
  }

  Future<List<PostModel>> _createPostList(List<PostModel> list,
      QueryDocumentSnapshot<Map<String, dynamic>> postDoc) async {
    String publishedBy =
        await _findUserName(postDoc[FirebaseKeysEnum.publishedBy.name]);
    PostModel model =
        PostModel.fromMap(postDoc.data()).copyWith(publishedBy: publishedBy);

    list.add(model);

    return list;
  }

  Future<String> _findUserName(String? uid) async {
    final String publishedBy = await firestore
        .collection(FirebaseKeysEnum.Users.name)
        .doc(uid)
        .get()
        .then((DocumentSnapshot<Map<String, dynamic>> doc) =>
            doc[FirebaseKeysEnum.userName.name]);
    return publishedBy;
  }
}
