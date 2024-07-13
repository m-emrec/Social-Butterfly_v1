import '../../../../core/utils/models/post_model.dart';

import '../../../../core/resources/data_state.dart';

abstract class CreatePostRepo {
  Future<DataState> createPost(PostModel post);
}
