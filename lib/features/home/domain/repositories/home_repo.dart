import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/models/post_model.dart';

abstract class HomeRepo {
  Future<DataState<List<PostModel>>> fetchListOfPostData();
  Future<DataState<PostModel>> updateListOfPostData(int index);
}
