import '../../../../core/resources/data_state.dart';
import '../../../../core/resources/use_case.dart';
import '../repositories/auth_repo.dart';

class SignInWithGoogle extends UseCase<DataState, void> {
  final AuthRepo _authRepo;

  SignInWithGoogle({required AuthRepo authRepo}) : _authRepo = authRepo;
  @override
  Future<DataState> call(void params) {
    return _authRepo.signInWithGoogle();
  }
}
