import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  Future<void> signInWithGoogle(void Function(UserCredential?) onUserData) async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      if (gUser != null) {
        final GoogleSignInAuthentication gAuth = await gUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken,
          idToken: gAuth.idToken,
        );

        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        onUserData(userCredential); // Pass the obtained UserCredential to the callback
      } else {
        print('Google sign-in cancelled or failed.');
        onUserData(null); // Pass null to the callback in case of failure
      }
    } catch (e) {
      print('Error during Google sign-in: $e');
      onUserData(null); // Pass null to the callback in case of error
    }
  }
}
