import '../../../../core/resources/data_state.dart';
import '../../../../core/resources/use_case.dart';
import '../entities/credentials_entity.dart';
import '../repositories/auth_repo.dart';

class SignUpWithEmailUsecase extends UseCase<DataState, CredentialsEntity> {
  final AuthRepo _authRepo;

  SignUpWithEmailUsecase({required AuthRepo authRepo}) : _authRepo = authRepo;
  @override
  Future<DataState> call(CredentialsEntity params) async {
    return await _authRepo.signUpWithEmail(
        email: params.email, password: params.password);
  }
}
