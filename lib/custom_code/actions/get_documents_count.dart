// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

// Begin custom action code
String getDocumentsCount() {
  // get the count of documents in firestore
  var firestore = FirebaseFirestore.instance;
  int noOfDocuments = 0;

  firestore.collection('financial_planner').get().then((results) {
    noOfDocuments = results.docs.length;
    //print(noOfDocuments);
  });

  return noOfDocuments.toString();
}
