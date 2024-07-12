import '../../../../core/resources/data_state.dart';
import '../../../../core/resources/use_case.dart';
import '../repositories/auth_repo.dart';

class ForgotPasswordUsecase extends UseCase<DataState, String> {
  final AuthRepo _authRepo;

  ForgotPasswordUsecase({required AuthRepo authRepo}) : _authRepo = authRepo;
  @override
  Future<DataState> call(String params) {
    return _authRepo.forgotPassword(email: params);
  }
}
