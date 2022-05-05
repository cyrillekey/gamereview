import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CommentsProvider with ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
}
