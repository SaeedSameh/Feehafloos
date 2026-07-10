import '/components/settings_item5/settings_item5_widget.dart';
import '/components/settings_item6/settings_item6_widget.dart';
import '/components/settings_item7/settings_item7_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'settings_group3_widget.dart' show SettingsGroup3Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsGroup3Model extends FlutterFlowModel<SettingsGroup3Widget> {
  ///  State fields for stateful widgets in this component.

  // Model for SettingsItem5.
  late SettingsItem5Model settingsItem5Model;
  // Model for SettingsItem6.
  late SettingsItem6Model settingsItem6Model;
  // Model for SettingsItem7.
  late SettingsItem7Model settingsItem7Model;

  @override
  void initState(BuildContext context) {
    settingsItem5Model = createModel(context, () => SettingsItem5Model());
    settingsItem6Model = createModel(context, () => SettingsItem6Model());
    settingsItem7Model = createModel(context, () => SettingsItem7Model());
  }

  @override
  void dispose() {
    settingsItem5Model.dispose();
    settingsItem6Model.dispose();
    settingsItem7Model.dispose();
  }
}
