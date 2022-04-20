import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:gamereview/services/service_locator.dart';

class AuthRepo with ChangeNotifier {
  bool isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<String?> signupUser(String email, String password) async {
    isLoading = true;
    notifyListeners();
    try {
      var res = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return res.user?.uid;
    } catch (e) {
      logger.e(e);
      isLoading = false;
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
  }
}
