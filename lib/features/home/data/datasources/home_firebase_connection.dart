import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_butterfly/logger.dart';

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

      Iterable<QueryDocumentSnapshot<Map<String, dynamic>>> listOfFirst3Post =
          _getRangeListOfDocs(query: query);

      postList = await _createPostList(postList, listOfFirst3Post);

      return DataSuccess(postList);
    } on RangeError {
      return DataSuccess(null);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  Future<DataState<PostModel>> updatePostList(int index) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> query =
          await _getOrderedQuery();
      final QueryDocumentSnapshot<Map<String, dynamic>> newPost =
          query.docs[index];

      final String publishedBy =
          await _findUserName(newPost[FirebaseKeysEnum.publishedBy.name]);

      final PostModel model =
          PostModel.fromMap(newPost.data()).copyWith(publishedBy: publishedBy);
      return DataSuccess(model);
    } on RangeError {
      return DataSuccess(null);
    } catch (e) {
      logger.e(e);
      return DataFailed(e);
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> _getOrderedQuery() async {
    final QuerySnapshot<Map<String, dynamic>> query = await postsCollection()
        .orderBy(FirebaseKeysEnum.createdDate.name, descending: true)
        .get();
    return query;
  }

  Iterable<QueryDocumentSnapshot<Map<String, dynamic>>> _getRangeListOfDocs({
    required QuerySnapshot<Map<String, dynamic>> query,
  }) {
    Iterable<QueryDocumentSnapshot<Map<String, dynamic>>> listOfPostDocs =
        query.docs.getRange(0, 3);

    return listOfPostDocs;
  }

  Future<List<PostModel>> _createPostList(
      List<PostModel> list,
      Iterable<QueryDocumentSnapshot<Map<String, dynamic>>>
          listOfFirst3Post) async {
    for (var doc in listOfFirst3Post) {
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
