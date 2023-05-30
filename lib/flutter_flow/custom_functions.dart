import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? formatPercentage(double number) {
  // convert input value to 2dp percentage
  if (number == null) {
    return null;
  }
  return (number * 100).toStringAsFixed(0) + '%';
}

double scenarioPercentage() {
  return 0;
}

Color formatPercentageBar(double percentage) {
  if (percentage >= 0.9) {
    return Colors.green;
  } else if (percentage < 0.9 && percentage >= 0.6) {
    return Colors.orange;
  } else {
    return Colors.red;
  }
}
