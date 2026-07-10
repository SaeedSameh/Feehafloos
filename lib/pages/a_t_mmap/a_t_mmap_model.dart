import '/backend/backend.dart';
import '/components/atm_details_sheet_widget.dart';
import '/components/loading_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'a_t_mmap_widget.dart' show ATMmapWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ATMmapModel extends FlutterFlowModel<ATMmapWidget> {
  ///  Local state fields for this page.

  String? activeBankSearch;

  String? cashOnlyFilter;

  LatLng? myRealLocation;

  List<AtmsRecord> myAtmsList = [];
  void addToMyAtmsList(AtmsRecord item) => myAtmsList.add(item);
  void removeFromMyAtmsList(AtmsRecord item) => myAtmsList.remove(item);
  void removeAtIndexFromMyAtmsList(int index) => myAtmsList.removeAt(index);
  void insertAtIndexInMyAtmsList(int index, AtmsRecord item) =>
      myAtmsList.insert(index, item);
  void updateMyAtmsListAtIndex(int index, Function(AtmsRecord) updateFn) =>
      myAtmsList[index] = updateFn(myAtmsList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in ATMmap widget.
  List<ReportsRecord>? reportlist;
  // Model for Loading component.
  late LoadingModel loadingModel;
  // State field(s) for SearchField widget.
  String? searchFieldValue;
  FormFieldController<String>? searchFieldValueController;

  @override
  void initState(BuildContext context) {
    loadingModel = createModel(context, () => LoadingModel());
  }

  @override
  void dispose() {
    loadingModel.dispose();
  }
}
