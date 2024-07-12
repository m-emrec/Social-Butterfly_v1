import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/resources/data_state.dart';

class GoogleSignInService {
  Future<DataState> signIn() async {
    try {
      final GoogleSignInAccount? _gSign = await GoogleSignIn().signIn();
      if (_gSign != null) {
        final GoogleSignInAuthentication _gAuth = await _gSign.authentication;
        final credential = GoogleAuthProvider.credential(
          idToken: _gAuth.idToken,
          accessToken: _gAuth.accessToken,
        );
        return DataSuccess(credential);
      }
      return DataFailed("Google sign in failed");
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
