import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/models/post_model.dart';

import '../../../../core/resources/fire_store_connection.dart';

class CreatePostFirebaseConnection extends FireBaseConnection {
  Future<DataState> createPost(PostModel post) async {
    try {
      /// try to get imageUrl
      final String? imageUrl = await getImageUrl(post.imageUrl);

      /// copy the post with the rest of the parameters
      post = post.copyWith(
        imageUrl: imageUrl,
        commentCount: 0,
        createdDate: DateTime.now(),
        likeCount: 0,
        publishedBy: uid,
      );
      Map<String, dynamic> data = post.toMap();

      /// Create post on Firestore
      await postsCollection()
          .add(data)
          .then((ref) => ref.update(post.copyWith(id: ref.id).toMap()));
      return DataSuccess(null);
    } catch (e) {
      return DataFailed(e);
    }
  }

  /// This function the gets the url of uploaded image from Database
  Future<String?> getImageUrl(String? imagePath) async {
    try {
      final snapshot = await uploadImageToDatabase(imagePath);
      final String? imagedUrl = await snapshot?.ref.getDownloadURL();
      return imagedUrl;
    } catch (e) {
      return null;
    }
  }

  /// This function uploads the given image to database
  Future<TaskSnapshot?> uploadImageToDatabase(String? imagePath) async {
    try {
      File? image = File(imagePath ?? "");

      final ref = storage
          .ref()
          .child('users/$uid/images/${DateTime.now().toIso8601String()}.jpg');
      final uploadTask = ref.putFile(image);
      final snapshot = await uploadTask.whenComplete(() {});
      return snapshot;
    } catch (e) {
      return null;
    }
  }
}
