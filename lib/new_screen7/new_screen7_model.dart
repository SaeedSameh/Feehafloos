import '/components/switch_component2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'new_screen7_widget.dart' show NewScreen7Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewScreen7Model extends FlutterFlowModel<NewScreen7Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for SwitchComponent.
  late SwitchComponent2Model switchComponentModel;

  @override
  void initState(BuildContext context) {
    switchComponentModel = createModel(context, () => SwitchComponent2Model());
  }

  @override
  void dispose() {
    switchComponentModel.dispose();
  }
}
