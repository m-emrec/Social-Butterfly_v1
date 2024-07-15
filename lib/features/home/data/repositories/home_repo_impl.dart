import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/models/post_model.dart';
import '../../domain/repositories/home_repo.dart';
import '../datasources/home_firebase_connection.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeFirebaseConnection _firebaseConnection;

  HomeRepoImpl({required HomeFirebaseConnection firebaseConnection})
      : _firebaseConnection = firebaseConnection;
  @override
  Future<DataState<List<PostModel>>> fetchListOfPostData() async {
    final DataState<List<PostModel>> dataState =
        await _firebaseConnection.fetchPostData();
    return dataState;
  }

  @override
  Future<DataState<PostModel>> updateListOfPostData(int index) async {
    final DataState<PostModel> dataState =
        await _firebaseConnection.updatePostList(index);
    return dataState;
  }
}
