import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      if (gUser != null) {
        final GoogleSignInAuthentication gAuth = await gUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken,
          idToken: gAuth.idToken,
        );
        print("Access Token: ${gAuth.accessToken}");

        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        // Retrieve the user information after signing in
        User? user = userCredential.user;
        print('User Email: ${user}');
        return userCredential;
      } else {
        print('Google sign-in cancelled or failed.');
        // Handle sign-in cancellation or failure
        return null;
      }
    } catch (e) {
      print('Error during Google sign-in: $e');
      // Handle the exception here
      return null;
    }
  }
}
