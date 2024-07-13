import '../../../../core/resources/data_state.dart';
import '../../../../core/resources/use_case.dart';
import '../../../../core/utils/models/post_model.dart';
import '../repositories/create_post_repo.dart';

class CreatePostUsecase extends UseCase<DataState, PostModel> {
  final CreatePostRepo _createPostRepo;

  CreatePostUsecase({required CreatePostRepo createPostRepo})
      : _createPostRepo = createPostRepo;
  @override
  Future<DataState> call(PostModel params) async {
    return await _createPostRepo.createPost(params);
  }
}
