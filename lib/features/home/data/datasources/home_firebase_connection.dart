import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/models/post_model.dart';

import '../../../../core/resources/fire_store_connection.dart';

class HomeFirebaseConnection extends FireBaseConnection {
  Future<DataState<PostModel>> fetchPostData(int index) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querry = await postsCollection()
          .orderBy("createdDate", descending: true)
          .get();

      List<QueryDocumentSnapshot> listOfPosts = querry.docs;
      Map<String, dynamic> doc =
          listOfPosts[index].data() as Map<String, dynamic>;

      PostModel postModel = PostModel.fromMap(doc);
      final String publishedBy = await firestore
          .collection("Users")
          .doc(postModel.publishedBy)
          .get()
          .then(
              (DocumentSnapshot<Map<String, dynamic>> doc) => doc["userName"]);
      postModel = postModel.copyWith(publishedBy: publishedBy);

      return DataSuccess(postModel);
    } on RangeError catch (_) {
      return DataSuccess(null);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
