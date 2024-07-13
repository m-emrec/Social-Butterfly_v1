import 'dart:io';

import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/models/post_model.dart';

import '../../../../core/resources/fire_store_connection.dart';

class CreatePostFirebaseConnection extends FireBaseConnection {
  Future<DataState> createPost(PostModel post) async {
    try {
      final String? imageUrl = await getImageUrl(post.imageUrl);
      post = post.copyWith(
        imageUrl: imageUrl,
        commentCount: 0,
        createdDate: DateTime.now(),
        likeCount: 0,
        publishedBy: uid,
      );
      Map<String, dynamic> data = post.toMap();

      await firestore
          .collection(PostCollectionKeys.Posts.name)
          .add(data)
          .then((ref) => ref.update(post.copyWith(id: ref.id).toMap()));
      return DataSuccess(null);
    } catch (e) {
      return DataFailed(e);
    }
  }

  Future<String?> getImageUrl(String? imagePath) async {
    try {
      File? image = File(imagePath ?? "");

      final ref = storage
          .ref()
          .child('users/$uid/images/${DateTime.now().toIso8601String()}.jpg');
      final uploadTask = ref.putFile(image);
      final snapshot = await uploadTask.whenComplete(() {});
      final String imagedUrl = await snapshot.ref.getDownloadURL();
      return imagedUrl;
    } catch (e) {
      return null;
    }
  }
}

enum PostCollectionKeys {
  Posts,
}
