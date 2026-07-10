import '/components/settings_item/settings_item_widget.dart';
import '/components/settings_item2/settings_item2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'settings_group_widget.dart' show SettingsGroupWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsGroupModel extends FlutterFlowModel<SettingsGroupWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for SettingsItem.
  late SettingsItemModel settingsItemModel;
  // Model for SettingsItem2.
  late SettingsItem2Model settingsItem2Model;

  @override
  void initState(BuildContext context) {
    settingsItemModel = createModel(context, () => SettingsItemModel());
    settingsItem2Model = createModel(context, () => SettingsItem2Model());
  }

  @override
  void dispose() {
    settingsItemModel.dispose();
    settingsItem2Model.dispose();
  }
}
