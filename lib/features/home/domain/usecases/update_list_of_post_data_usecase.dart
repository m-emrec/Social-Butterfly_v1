import '../../../../core/resources/data_state.dart';
import '../../../../core/resources/use_case.dart';
import '../../../../core/utils/models/post_model.dart';
import '../repositories/home_repo.dart';

class UpdateListOfPostDataUsecase extends UseCase<DataState<PostModel>, int> {
  final HomeRepo _homeRepo;

  UpdateListOfPostDataUsecase(this._homeRepo);
  @override
  Future<DataState<PostModel>> call(int params) async {
    return await _homeRepo.updateListOfPostData(params);
  }
}
