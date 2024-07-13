import '../datasources/create_post_firebase_connection.dart';

import '../../../../core/resources/data_state.dart';

import '../../../../core/utils/models/post_model.dart';

import '../../domain/repositories/create_post_repo.dart';

class CreatePostRepoImpl extends CreatePostRepo {
  final CreatePostFirebaseConnection _createPostFirebaseConnection;

  CreatePostRepoImpl(
      {required CreatePostFirebaseConnection createPostFirebaseConnection})
      : _createPostFirebaseConnection = createPostFirebaseConnection;
  @override
  Future<DataState> createPost(PostModel post) async {
    final DataState dataState =
        await _createPostFirebaseConnection.createPost(post);

    return dataState;
  }
}
