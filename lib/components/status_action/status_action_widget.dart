import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'status_action_model.dart';
export 'status_action_model.dart';

class StatusActionWidget extends StatefulWidget {
  const StatusActionWidget({
    super.key,
    Color? bgColor,
    this.icon,
    Color? textColor,
    String? label,
  })  : this.bgColor = bgColor ?? const Color(0x00000000),
        this.textColor = textColor ?? const Color(0x00000000),
        this.label = label ?? 'Has Cash';

  final Color bgColor;
  final Widget? icon;
  final Color textColor;
  final String label;

  @override
  State<StatusActionWidget> createState() => _StatusActionWidgetState();
}

class _StatusActionWidgetState extends State<StatusActionWidget> {
  late StatusActionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusActionModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          widget!.bgColor,
          FlutterFlowTheme.of(context).success,
        ),
        borderRadius: BorderRadius.circular(24.0),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          child: Container(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget!.icon!,
                Text(
                  valueOrDefault<String>(
                    widget!.label,
                    'Has Cash',
                  ),
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelSmall.fontStyle,
                        ),
                        color: valueOrDefault<Color>(
                          widget!.textColor,
                          FlutterFlowTheme.of(context).onSuccess,
                        ),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelSmall.fontStyle,
                        lineHeight: 1.2,
                      ),
                ),
              ].divide(SizedBox(height: 4.0)),
            ),
          ),
        ),
      ),
    );
  }
}
