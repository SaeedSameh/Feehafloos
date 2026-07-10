import '/components/settings_item3/settings_item3_widget.dart';
import '/components/settings_item4/settings_item4_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settings_group2_model.dart';
export 'settings_group2_model.dart';

class SettingsGroup2Widget extends StatefulWidget {
  const SettingsGroup2Widget({
    super.key,
    String? title,
  }) : this.title = title ?? 'NOTIFICATIONS';

  final String title;

  @override
  State<SettingsGroup2Widget> createState() => _SettingsGroup2WidgetState();
}

class _SettingsGroup2WidgetState extends State<SettingsGroup2Widget> {
  late SettingsGroup2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsGroup2Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
          child: Container(
            child: Text(
              valueOrDefault<String>(
                widget!.title,
                'NOTIFICATIONS',
              ),
              style: FlutterFlowTheme.of(context).labelLarge.override(
                    font: GoogleFonts.inter(
                      fontWeight:
                          FlutterFlowTheme.of(context).labelLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelLarge.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primary,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).labelLarge.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelLarge.fontStyle,
                    lineHeight: 1.3,
                  ),
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(24.0),
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(24.0),
              shape: BoxShape.rectangle,
              border: Border.all(
                color: FlutterFlowTheme.of(context).alternate,
                width: 1.0,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    wrapWithModel(
                      model: _model.settingsItem3Model,
                      updateCallback: () => safeSetState(() {}),
                      child: SettingsItem3Widget(
                        icon: Icon(
                          Icons.account_balance_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 22.0,
                        ),
                        label: 'Bank Alerts',
                        subtitle: 'Notify for Chase, Wells Fargo',
                        hasSubtitle: true,
                        last: false,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.settingsItem4Model,
                      updateCallback: () => safeSetState(() {}),
                      child: SettingsItem4Widget(
                        icon: Icon(
                          Icons.help,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 22.0,
                        ),
                        label: 'Status Updates',
                        subtitle: 'When nearby ATMs change',
                        hasSubtitle: true,
                        last: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ].divide(SizedBox(height: 8.0)),
    );
  }
}
