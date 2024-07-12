import '../../../../core/resources/data_state.dart';
import '../../../../core/resources/use_case.dart';
import '../repositories/auth_repo.dart';

class SignInWithEmailUsecase extends UseCase<DataState, Map> {
  final AuthRepo _authRepo;

  SignInWithEmailUsecase({required AuthRepo authRepo}) : _authRepo = authRepo;
  @override
  Future<DataState> call(Map params) {
    return _authRepo.signInWithEmail(
        email: params["email"], password: params["password"]);
  }
}
