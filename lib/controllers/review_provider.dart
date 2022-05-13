import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:gamereview/models/review.dart';

class ReviewProvider with ChangeNotifier {
  List<Review> reviews = [];
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> saveReview(String game_id, var data) async {
    try {
      await _firestore.collection("/${game_id}").doc().set(data);
      notifyListeners();
    } catch (e) {
      notifyListeners();
      rethrow;
    }
  }

  Future<void> getAllReviews() async {
    try {
      var snapshot = await _firestore.doc("game_id").get();
    } catch (e) {}
  }
}
