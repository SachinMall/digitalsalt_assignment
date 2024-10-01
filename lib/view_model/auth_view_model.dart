import 'dart:developer';
import 'package:digitalsalt_assignment/model/user_mode.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:digitalsalt_assignment/utils/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();


// firebase google sigin fn
 Future<UserModel?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(credential);
      User? user = userCredential.user;

      if (user != null) {
        return UserModel(
          email: user.email ?? '',
          firstName: user.displayName ?? '',
          lastName: '',
        );
      }
    } catch (e) {
      log('Error signing in with Google: $e');
      Utils.toastMessage('Google Sign-In failed');
    }
    return null;
  }

// firebase sign In with email
  Future<UserModel?> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user != null) {
        return UserModel(
          email: user.email ?? '',
          firstName: '',
          lastName: '',
        );
      }
    } on FirebaseAuthException catch (e) {
      log('Error signing in: $e');
      Utils.toastMessage('Login failed');
    }
    return null;
  }

// firebase signup fn
  Future<UserCredential?> signUpWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      log('Error signing up: $e');
      Utils.toastMessage(e.message ?? 'Sign up failed');
    }
    return null;
  }

// signOut fn
   Future<void> signOut() async {
    await _auth.signOut();
  }

}
