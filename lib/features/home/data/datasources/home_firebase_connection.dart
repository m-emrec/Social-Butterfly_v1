import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/models/post_model.dart';

import '../../../../core/resources/fire_store_connection.dart';

class HomeFirebaseConnection extends FireBaseConnection {
  Future<DataState<List<PostModel>>> fetchPostData(
      List<PostModel> postList) async {
    final List<PostModel> _postList = [];
    try {
      final QuerySnapshot<Map<String, dynamic>> query = await postsCollection()
          .orderBy("createdDate", descending: true)
          .get();

      Iterable<QueryDocumentSnapshot<Map<String, dynamic>>> listOfPostDocs =
          query.docs.getRange(postList.length, postList.length + 3);

      for (var doc in listOfPostDocs) {
        String publishedBy = await findUserName(doc["publishedBy"]);
        PostModel model =
            PostModel.fromMap(doc.data()).copyWith(publishedBy: publishedBy);
        _postList.add(model);
      }

      return DataSuccess(_postList);
    } on RangeError catch (e) {
      return DataSuccess(null);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  Future<String> findUserName(String? uid) async {
    final String publishedBy = await firestore
        .collection("Users")
        .doc(uid)
        .get()
        .then((DocumentSnapshot<Map<String, dynamic>> doc) => doc["userName"]);
    return publishedBy;
  }
}
