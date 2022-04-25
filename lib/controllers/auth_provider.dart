import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gamereview/screens/welcome.dart';
import 'package:gamereview/services/service_locator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';

class Authprovider with ChangeNotifier {
  bool isLoading = false;
  User? user;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final twitterLogin = TwitterLogin(
      apiKey: 'p5NLjJM9P07X9SSX3JQk6r7gn',
      apiSecretKey: 'LdeURSMXhFtDJbSmQ15Aubrt8DtZ183kOxuXmeEDllyvZ81Ni5',
      redirectURI: 'twitter-firebase-auth://');
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
  }

  set _user(User user) {
    this.user = user;
  }

  Future<User?> loginUser(String email, String password) async {
    isLoading = true;
    notifyListeners();
    try {
      var res = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return res.user;
    } catch (e) {
      rethrow;
    }
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
    // ignore: avoid_single_cascade_in_expression_statements, await_only_futures
    await _auth.currentUser!
      ..reload();
    User user = _auth.currentUser!;
    this.user = user;
    return user.emailVerified;
  }

  Future logoutuser(BuildContext context) async {
    googleSignIn.signOut();
    FacebookAuth.instance.logOut();
    _auth.signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => WelcomePage()),
        (route) => false);
  }

  Future<bool> resendEmailVerification() async {
    try {
      await _auth.currentUser!.sendEmailVerification();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<User?> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      switch (result.status) {
        case LoginStatus.success:
          final AuthCredential facebookCredential =
              FacebookAuthProvider.credential(result.accessToken!.token);
          final userCredential =
              await _auth.signInWithCredential(facebookCredential);
          user = userCredential.user;
          return userCredential.user;
        case LoginStatus.failed:
          return null;
        case LoginStatus.cancelled:
          return null;
        default:
          return null;
      }
    } on FirebaseAuthException catch (e) {
      throw e;
    } catch (e) {}
  }

  Future<User?> signUpWithTwitter() async {
    final authResult = await twitterLogin.login();
    switch (authResult.status) {
      case TwitterLoginStatus.loggedIn:
        final AuthCredential twitter = TwitterAuthProvider.credential(
            accessToken: authResult.authToken!,
            secret: authResult.authTokenSecret!);
        final userCredential = await _auth.signInWithCredential(twitter);
        user = userCredential.user;
        return userCredential.user;
      case TwitterLoginStatus.cancelledByUser:
        return null;
      default:
        return null;
    }
  }

  Future<bool> resetUserPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
