import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_butterfly/logger.dart';

import '../../../../core/resources/data_state.dart';

import '../../../../core/resources/fire_store_connection.dart';

class AuthFirebaseConnection extends FireBaseConnection {
  Future<DataState> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return DataSuccess(null);
    } catch (e) {
      logger.e(e);
      return DataFailed(e.toString());
    }
  }

  Future<DataState> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return DataSuccess(null);
    } catch (e) {
      logger.e(e);
      return DataFailed(e.toString());
    }
  }

  Future<DataState> forgotPassword({
    required String email,
  }) async {
    try {
      firebaseAuth.sendPasswordResetEmail(
        email: email,
      );
      return DataSuccess(null);
    } catch (e) {
      logger.e(e);
      return DataFailed(e.toString());
    }
  }

  Future<DataState> signInWithGoogle(AuthCredential credential) async {
    try {
      await firebaseAuth.signInWithCredential(credential);

      return DataSuccess(null);
    } on FirebaseAuthException catch (e) {
      return DataFailed(e.code);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
