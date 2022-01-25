// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:firebase_auth/firebase_auth.dart';

Future ifSubscribe() async {
  // Add your function code here!
  final firestoreInstance = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;
  final uid = firebaseAuth.currentUser.uid.toString();

  var today = DateTime.now();

  for (int i = 1; i <= 90; i++) {
    firestoreInstance.collection("ninety_days_challenge").add({
      "uid": uid,
      "day": "day $i",
      "label": i,
      "date": today.add(Duration(days: i)),
      "completed": false,
    });
  }
}
