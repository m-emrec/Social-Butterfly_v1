import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/enums/firebase_keys_enum.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/resources/fire_store_connection.dart';
import '../../../../core/utils/models/post_model.dart';

class HomeFirebaseConnection extends FireBaseConnection {
  Future<DataState<List<PostModel>>> fetchPostData(
      List<PostModel> fetchedPostList) async {
    List<PostModel> postList = [];
    try {
      final QuerySnapshot<Map<String, dynamic>> query =
          await _getOrderedQuery();

      Iterable<QueryDocumentSnapshot<Map<String, dynamic>>> listOfPostDocs =
          _getRangeListOfDocs(
              start: fetchedPostList.length, end: 3, query: query);

      postList = await _createPostList(postList, listOfPostDocs);

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

  Iterable<QueryDocumentSnapshot<Map<String, dynamic>>> _getRangeListOfDocs({
    required int start,
    required int end,
    required QuerySnapshot<Map<String, dynamic>> query,
  }) {
    Iterable<QueryDocumentSnapshot<Map<String, dynamic>>> listOfPostDocs =
        query.docs.getRange(start, start + 3);
    return listOfPostDocs;
  }

  Future<List<PostModel>> _createPostList(
      List<PostModel> list,
      Iterable<QueryDocumentSnapshot<Map<String, dynamic>>>
          listOfPostDocs) async {
    for (var doc in listOfPostDocs) {
      String publishedBy =
          await _findUserName(doc[FirebaseKeysEnum.publishedBy.name]);
      PostModel model =
          PostModel.fromMap(doc.data()).copyWith(publishedBy: publishedBy);
      list.add(model);
    }
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
