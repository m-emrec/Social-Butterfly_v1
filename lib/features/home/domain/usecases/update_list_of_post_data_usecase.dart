import '../../../../core/resources/data_state.dart';
import '../../../../core/resources/use_case.dart';
import '../../../../core/utils/models/post_model.dart';
import '../repositories/home_repo.dart';

class UpdateListOfPostDataUsecase
    extends UseCase<DataState<List<PostModel>>, List<PostModel>> {
  final HomeRepo _homeRepo;

  UpdateListOfPostDataUsecase(this._homeRepo);
  @override
  Future<DataState<List<PostModel>>> call(List<PostModel> params) async {
    return await _homeRepo.updateListOfPostData(params);
  }
}
