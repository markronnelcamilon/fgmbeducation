// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:firebase_auth/firebase_auth.dart';

Future addtwentyonedays() async {
  // Add your function code here!
  final firestoreInstance = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;
  final uid = firebaseAuth.currentUser.uid.toString();

  var today = DateTime.now();

  var arr = [
    'Wrote down my goals',
    'Wrote down my quarterly goals',
    'Read 10 pages of a book',
    'Completed all 5 Tasks',
    'Create an IG Post \n#FGMBChallenge \n#WinTheDay \n#21DayChallenge \n@fgmhub'
  ];

  for (int i = 1; i <= 21; i++) {
    firestoreInstance.collection("twenty_one_days_challenge").add({
      "uid": uid,
      "day": "Day $i",
      "label": i,
      "date": today.add(Duration(days: i)),
      "completed": false,
      "task1": false,
      "task2": false,
      "task3": false,
      "task4": false,
      "task5": false,
    });

    for (int x = 0; x <= 4; x++) {
      var y = x + 1;
      firestoreInstance.collection('task21').add({
        "uid": uid,
        "subscription_name": "21 Days Challenge",
        "task$y": false,
        "day": "Day $i",
        "label": y,
        "taskName": arr[x],
      });
    }
  }
}
