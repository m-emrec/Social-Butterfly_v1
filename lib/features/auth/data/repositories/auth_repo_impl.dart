import '../../../../core/resources/data_state.dart';
import '../../domain/repositories/auth_repo.dart';
import '../datasources/auth_firebase_connection.dart';
import '../datasources/google_sign_in.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthFirebaseConnection _authFirebaseConnection;

  AuthRepoImpl({required AuthFirebaseConnection authFirebaseConnection})
      : _authFirebaseConnection = authFirebaseConnection;

  @override
  Future<DataState> forgotPassword({required String email}) async {
    return await _authFirebaseConnection.forgotPassword(email: email);
  }

  @override
  Future<DataState> signInWithEmail(
      {required String email, required String password}) async {
    return await _authFirebaseConnection.signInWithEmail(
        email: email, password: password);
  }

  @override
  Future<DataState> signInWithGoogle() async {
    final credential = await GoogleSignInService().signIn();

    if (credential is DataSuccess) {
      return await _authFirebaseConnection.signInWithGoogle(credential.data);
    }
    return DataFailed(credential.exception);
  }

  @override
  Future<DataState> signUpWithEmail(
      {required String email, required String password}) async {
    return await _authFirebaseConnection.signUpWithEmail(
        email: email, password: password);
  }
}
