import '../../../../core/resources/data_state.dart';
import '../../../../core/resources/use_case.dart';
import '../repositories/home_repo.dart';

import '../../../../core/utils/models/post_model.dart';

class FetchPostDataUsecase extends UseCase<DataState<PostModel>, int> {
  final HomeRepo _homeRepo;

  FetchPostDataUsecase({required HomeRepo homeRepo}) : _homeRepo = homeRepo;
  @override
  Future<DataState<PostModel>> call(int params) async {
    return await _homeRepo.fetchPostData(params);
  }
}
