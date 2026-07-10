import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String translateStatuss(
  String? statusText,
  String? currentLang,
) {
  if (statusText == null || statusText.trim().isEmpty) {
    return currentLang == 'ar' ? 'غير معروف' : 'Unknown';
  }

  String lowerStatus = statusText.toLowerCase().trim();

  if (lowerStatus == 'has cash') {
    return currentLang == 'ar' ? 'فيها فلوس' : 'Has Cash';
  }

  if (lowerStatus == 'empty' || lowerStatus == 'no cash') {
    return currentLang == 'ar' ? 'فاضية' : 'Empty';
  }

  if (lowerStatus == 'broken' || lowerStatus == 'out of service') {
    return currentLang == 'ar' ? 'عطلانة' : 'Broken';
  }

  return statusText;
}
