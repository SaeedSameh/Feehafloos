import '/components/settings_item5/settings_item5_widget.dart';
import '/components/settings_item6/settings_item6_widget.dart';
import '/components/settings_item7/settings_item7_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settings_group3_model.dart';
export 'settings_group3_model.dart';

class SettingsGroup3Widget extends StatefulWidget {
  const SettingsGroup3Widget({
    super.key,
    String? title,
  }) : this.title = title ?? 'SUPPORT';

  final String title;

  @override
  State<SettingsGroup3Widget> createState() => _SettingsGroup3WidgetState();
}

class _SettingsGroup3WidgetState extends State<SettingsGroup3Widget> {
  late SettingsGroup3Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsGroup3Model());
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
                'SUPPORT',
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
                      model: _model.settingsItem5Model,
                      updateCallback: () => safeSetState(() {}),
                      child: SettingsItem5Widget(
                        icon: Icon(
                          Icons.help_outline_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 22.0,
                        ),
                        label: 'Help Center',
                        subtitle: '',
                        hasSubtitle: false,
                        last: false,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.settingsItem6Model,
                      updateCallback: () => safeSetState(() {}),
                      child: SettingsItem6Widget(
                        icon: Icon(
                          Icons.verified_user_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 22.0,
                        ),
                        label: 'Privacy Policy',
                        subtitle: '',
                        hasSubtitle: false,
                        last: false,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.settingsItem7Model,
                      updateCallback: () => safeSetState(() {}),
                      child: SettingsItem7Widget(
                        icon: Icon(
                          Icons.info_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 22.0,
                        ),
                        label: 'App Version',
                        subtitle: 'v2.4.0 (Build 102)',
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
