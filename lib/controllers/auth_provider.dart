import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:gamereview/services/service_locator.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authprovider with ChangeNotifier {
  bool isLoading = false;
  User? user;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<User?> signupUser(String email, String password) async {
    isLoading = true;
    notifyListeners();
    try {
      var res = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      res.user?.sendEmailVerification();
      user = res.user;
      return res.user;
    } catch (e) {
      isLoading = false;
      notifyListeners();
      rethrow;
    }
    isLoading = false;
    notifyListeners();
  }

  Future<String?> loginUser(String email, String password) async {
    isLoading = true;
    notifyListeners();
    try {
      var res = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return res.user?.uid;
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<User?> siginWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication authentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: authentication.accessToken,
          idToken: authentication.idToken);
      try {
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        return userCredential.user;
      } catch (e) {
        logger.e(e);
      }
    }
  }

  Future<bool> verifyEmail() async {
    await _auth.currentUser!
      ..reload();
    User user = _auth.currentUser!;
    return user.emailVerified;
  }
}
