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
