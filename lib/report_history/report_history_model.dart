import '/backend/backend.dart';
import '/components/filterstatuesheet_widget.dart';
import '/components/noreport_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'report_history_widget.dart' show ReportHistoryWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReportHistoryModel extends FlutterFlowModel<ReportHistoryWidget> {
  ///  Local state fields for this page.

  String? filterstatue;

  List<ReportsRecord> myReport = [];
  void addToMyReport(ReportsRecord item) => myReport.add(item);
  void removeFromMyReport(ReportsRecord item) => myReport.remove(item);
  void removeAtIndexFromMyReport(int index) => myReport.removeAt(index);
  void insertAtIndexInMyReport(int index, ReportsRecord item) =>
      myReport.insert(index, item);
  void updateMyReportAtIndex(int index, Function(ReportsRecord) updateFn) =>
      myReport[index] = updateFn(myReport[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Bottom Sheet - filterstatuesheet] action in IconButton widget.
  String? selectedStatus;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
