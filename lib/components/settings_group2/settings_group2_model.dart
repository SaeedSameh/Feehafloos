import '/components/settings_item3/settings_item3_widget.dart';
import '/components/settings_item4/settings_item4_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'settings_group2_widget.dart' show SettingsGroup2Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsGroup2Model extends FlutterFlowModel<SettingsGroup2Widget> {
  ///  State fields for stateful widgets in this component.

  // Model for SettingsItem3.
  late SettingsItem3Model settingsItem3Model;
  // Model for SettingsItem4.
  late SettingsItem4Model settingsItem4Model;

  @override
  void initState(BuildContext context) {
    settingsItem3Model = createModel(context, () => SettingsItem3Model());
    settingsItem4Model = createModel(context, () => SettingsItem4Model());
  }

  @override
  void dispose() {
    settingsItem3Model.dispose();
    settingsItem4Model.dispose();
  }
}
