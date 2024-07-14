import '../../../../core/resources/data_state.dart';
import '../../../../core/resources/use_case.dart';
import '../repositories/home_repo.dart';

import '../../../../core/utils/models/post_model.dart';

class FetchPostDataUsecase extends UseCase<DataState<List<PostModel>>, void> {
  final HomeRepo _homeRepo;

  FetchPostDataUsecase({required HomeRepo homeRepo}) : _homeRepo = homeRepo;
  @override
  Future<DataState<List<PostModel>>> call(void params) async {
    return await _homeRepo.fetchListOfPostData();
  }
}
