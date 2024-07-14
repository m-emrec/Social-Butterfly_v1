import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/models/post_model.dart';

abstract class HomeRepo {
  Future<DataState<PostModel>> fetchPostData(int index);
}
