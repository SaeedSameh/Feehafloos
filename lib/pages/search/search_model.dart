import '/backend/backend.dart';
import '/components/drawer_widget.dart';
import '/components/first_time_widget.dart';
import '/components/offernews_widget.dart';
import '/components/update_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'search_widget.dart' show SearchWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchModel extends FlutterFlowModel<SearchWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Search widget.
  AppConfigRecord? configData;
  // Stores action output result for [Firestore Query - Query a collection] action in Search widget.
  GlobalNotificationRecord? prompResult;
  // Stores action output result for [Firestore Query - Query a collection] action in Search widget.
  FirstTimeRecord? firsttimeopen;
  // State field(s) for SearchField widget.
  String? searchFieldValue;
  FormFieldController<String>? searchFieldValueController;
  // State field(s) for PopluarBanks widget.
  FormFieldController<List<String>>? popluarBanksValueController;
  String? get popluarBanksValue =>
      popluarBanksValueController?.value?.firstOrNull;
  set popluarBanksValue(String? val) =>
      popluarBanksValueController?.value = val != null ? [val] : [];
  // Model for Drawer component.
  late DrawerModel drawerModel;

  @override
  void initState(BuildContext context) {
    drawerModel = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    drawerModel.dispose();
  }
}
