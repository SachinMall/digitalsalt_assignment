import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final _auth = FirebaseAuth.instance;

  Future<void> signInWithGoogle() async {
    try {
      log("Starting Google sign-in");

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      log("Google account selected");

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        // getting auth credentials
        final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        // signing in with the obtained credentials
        await _auth.signInWithCredential(authCredential).then((value) async {
          log("Sign-in successful!");
          log("User Email: ${value.additionalUserInfo!.profile!["email"]}");
          log("User Name: ${value.additionalUserInfo!.profile!["name"]}");

          final email = value.additionalUserInfo!.profile!["email"].toString();
          final name = value.additionalUserInfo!.profile!["name"].toString();

          // You can add your post-login logic here
        });
      }
    } on FirebaseAuthException catch (e) {
      // error handling
      log("Google Sign-in Error: ${e.message}");
    }
  }
}
