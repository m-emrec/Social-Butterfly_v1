import '../../../../core/resources/data_state.dart';

abstract class AuthRepo {
  /// SignIn with email
  Future<DataState> signInWithEmail({
    required String email,
    required String password,
  });

  /// SignUp with email
  Future<DataState> signUpWithEmail({
    required String email,
    required String password,
    required String userName,
  });

  //Forgot password
  Future<DataState> forgotPassword({
    required String email,
  });

  /// SignUp with email
  Future<DataState> signInWithGoogle();
}
