import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_butterfly/core/constants/enums/firebase_keys_enum.dart';

import '../../../../core/resources/data_state.dart';

import '../../../../core/resources/fire_store_connection.dart';

class AuthFirebaseConnection extends FireBaseConnection {
  Future<DataState> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return DataSuccess(null);
    } on FirebaseAuthException catch (e) {
      return DataFailed(e.code);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  Future<DataState> signUpWithEmail({
    required String email,
    required String password,
    required String userName,
  }) async {
    try {
      final UserCredential _user =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      firestore
          .collection(FirebaseKeysEnum.Users.name)
          .doc(_user.user!.uid)
          .set({
        FirebaseKeysEnum.userName.name: userName,
      });

      return DataSuccess(null);
    } on FirebaseAuthException catch (e) {
      return DataFailed(e.code);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  Future<DataState> forgotPassword({
    required String email,
  }) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(
        email: email,
      );
      return DataSuccess(null);
    } on FirebaseAuthException catch (e) {
      return DataFailed(e.code);
    } catch (e) {
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
