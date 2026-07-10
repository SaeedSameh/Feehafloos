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

String? getBankCode(String? selectedBankName) {
  if (selectedBankName == null || selectedBankName.trim().isEmpty) {
    return '';
  }

  String cleanName = selectedBankName.trim();

  if (cleanName == 'البنك الأهلي المصري (NBE)' ||
      cleanName == 'NBE' ||
      cleanName == 'البنك الاهلي المصري' ||
      cleanName == 'National Bank of Egypt ( NBE )') {
    return 'nbe';
  } else if (cleanName == 'البنك التجاري الدولي (CIB)' || cleanName == 'CIB') {
    return 'cib';
  } else if (cleanName == 'بنك مصر' || cleanName == 'Banque Misr') {
    return 'misr';
  } else if (cleanName == 'بنك القاهرة' || cleanName == 'Banque du Caire') {
    return 'caire';
  } else if (cleanName == 'بنك قطر الوطني' || cleanName == 'QNB') {
    return 'qnb';
  } else if (cleanName == 'بنك اسكندرية' || cleanName == 'Alexbank') {
    return 'alex';
  } else if (cleanName == 'بنك الإسكان و التعمير (HDB)' ||
      cleanName == 'Housing and Development Bank ( HDB )') {
    return 'hdb';
  } else if (cleanName == 'بنك قناة السويس' || cleanName == 'Suez Canal Bank') {
    return 'suez';
  } else if (cleanName == 'البنك الخليجي المصري (EG-BANK)' ||
      cleanName == 'Egyptian Gulf Bank (EG-BANK)') {
    return 'egbank';
  } else if (cleanName == 'المصرف المتحد' ||
      cleanName == 'The United Bank of Egypt') {
    return 'united';
  } else if (cleanName == 'بنك أبوظبي الأول (FAB مصر)' ||
      cleanName == 'First Abu Dhabi Bank (FAB Misr)') {
    return 'fab';
  } else if (cleanName == 'كريدي أجريكول مصر' ||
      cleanName == 'Crédit Agricole Egypt') {
    return 'agricole';
  } else if (cleanName == 'المصرف العربي الدولي (AIB)' ||
      cleanName == 'Arab International Bank (AIB)') {
    return 'aib';
  } else if (cleanName == 'بنك التمويل الكويتي' || cleanName == 'KFH Egypt') {
    return 'kfh';
  } else if (cleanName == 'بنك فيصل الإسلامي بمصر' ||
      cleanName == 'Faisal Islamic Bank of Egypt') {
    return 'faisal';
  } else if (cleanName == 'بنك الإمارات دبي الوطني' ||
      cleanName == 'Emirates NBD') {
    return 'nbd';
  } else if (cleanName == 'البنك العربي' || cleanName == 'Arab Bank Egypt') {
    return 'arab';
  } else if (cleanName == 'البنك الوطني الكويتي (NBK)' ||
      cleanName == 'National Bank of Kuwait (NBK)') {
    return 'nbk';
  } else if (cleanName == 'بنك المشرق' || cleanName == 'Mashreq Bank') {
    return 'mshreq';
  } else if (cleanName == 'بنك ABC' || cleanName == 'Bank ABC') {
    return 'abc';
  } else if (cleanName == 'بنك التجاري وفا مصر' ||
      cleanName == 'Attijariwafa Bank Egypt') {
    return 'wafa';
  } else if (cleanName == 'مصرف أبو ظبي الإسلامي (ADIB مصر)' ||
      cleanName == 'Abu Dhabi Islamic Bank (ADIB Egypt)' ||
      cleanName == 'ADIB Egypt' ||
      cleanName == 'ابو ظبي الاسلامي') {
    return 'adib';
  } else if (cleanName == 'بنك البركة مصر' ||
      cleanName == 'Al Baraka Bank Egypt') {
    return 'barka';
  } else if (cleanName == 'البنك الزراعي المصري (ABE)' ||
      cleanName == 'Agricultural Bank of Egypt (ABE)') {
    return 'abe';
  } else if (cleanName == 'ميدبانك' || cleanName == 'MIDBANK') {
    return 'mid';
  } else if (cleanName == 'البنك العربي الافريقي' ||
      cleanName == 'Arab African International') {
    return 'aaib';
  } else if (cleanName == 'بنك نكست' || cleanName == 'Bank NXT') {
    return 'nxt';
  } else if (cleanName == 'بنك سايب' || cleanName == 'saib Bank') {
    return 'saib';
  }

  return '';
}
