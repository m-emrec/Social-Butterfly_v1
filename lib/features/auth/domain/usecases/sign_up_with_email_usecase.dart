import '../../../../core/resources/data_state.dart';
import '../../../../core/resources/use_case.dart';
import '../repositories/auth_repo.dart';

class SignUpWithEmailUsecase extends UseCase<DataState, Map> {
  final AuthRepo _authRepo;

  SignUpWithEmailUsecase({required AuthRepo authRepo}) : _authRepo = authRepo;
  @override
  Future<DataState> call(Map params) {
    return _authRepo.signUpWithEmail(
        email: params["email"], password: params["password"]);
  }
}
