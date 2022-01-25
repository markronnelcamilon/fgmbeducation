import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String dateToday() {
  // get the day today
  var today = DateTime.now();
  var formatter = new DateFormat('E');
  var formattedDate = formatter.format(today);
  if (formattedDate.toString() == "Thu") {
    formattedDate = "Daym";
  }
  return formattedDate.toString();
}

String task05() {
  return "Task 05";
}

String getAllTheSum() {
  // get the sum of all amount in firestore
  final firestoreInstance = FirebaseFirestore.instance;
  double sum = 0;
  firestoreInstance.collection('financial_planner').get().then((querySnapshot) {
    querySnapshot.docs.forEach((result) {
      int count = int.parse(result["amount"]);
      sum = sum + count;
    });
  });
  return sum.toString();
}

String countNumberOfDocuments(int noOfDocs) {
  // get the number of documents in firestore
  var noOfDocs = FirebaseFirestore.instance
      .collection('financial_planner')
      .snapshots()
      .length
      .toString();

  return noOfDocs;
}

int noOfDocs() {
  Future noOfDocus() async {
    final firestoreInstance = FirebaseFirestore.instance;

    final QuerySnapshot qSnap =
        await FirebaseFirestore.instance.collection('financial_planner').get();
    final int documents = qSnap.docs.length;
    print(documents);
    return documents;
  }
}

int noOfWants() {
  // Add your function code here!
  return 10;
}

DateTime add21DaysToCurrentDay() {
  // add 21 days to current day
  DateTime currentDay = DateTime.now();
  DateTime lastDay = currentDay.add(new Duration(days: 21));
  return lastDay;
}

String return21DayChallengeText() {
  return '21 Day Challenge';
}

String string21Day() {
  return '21 Day Challenge';
}

bool dateIsToday() {
  // Check if the date is today
  final now = new DateTime.now();
  var nowUtc = new DateTime.utc(now.year, now.month, now.day);
  var today = new DateTime(nowUtc.year, nowUtc.month, nowUtc.day);
  return nowUtc.difference(today) < Duration();
}

bool currentDay() {
  // return true if the date is today
  var now = DateTime.now();
  return now.day == DateTime.now().day;
}
