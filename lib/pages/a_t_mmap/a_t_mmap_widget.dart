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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'a_t_mmap_model.dart';
export 'a_t_mmap_model.dart';

class ATMmapWidget extends StatefulWidget {
  const ATMmapWidget({
    super.key,
    this.filterstatue,
    this.incomingBankCode,
    this.incomingCashFilter,
  });

  final String? filterstatue;
  final String? incomingBankCode;
  final String? incomingCashFilter;

  static String routeName = 'ATMmap';
  static String routePath = '/aTMmap';

  @override
  State<ATMmapWidget> createState() => _ATMmapWidgetState();
}

class _ATMmapWidgetState extends State<ATMmapWidget> {
  late ATMmapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ATMmapModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      _model.activeBankSearch = widget!.incomingBankCode;
      _model.cashOnlyFilter = widget!.incomingCashFilter;
      _model.myRealLocation = currentUserLocationValue;
      safeSetState(() {});
      _model.reportlist = await queryReportsRecordOnce(
        queryBuilder: (reportsRecord) => reportsRecord
            .where(
              'timestamp',
              isGreaterThan: FFAppState().lastSeenReports,
            )
            .where(
              'isRead',
              isEqualTo: false,
            ),
        limit: 30,
      );
      FFAppState().globalReportsCount = _model.reportlist!.length;
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          alignment: AlignmentDirectional(-1.0, -1.0),
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              decoration: BoxDecoration(),
              child: FutureBuilder<List<AtmsRecord>>(
                future: queryAtmsRecordOnce(
                  queryBuilder: (atmsRecord) => atmsRecord
                      .where(
                        'bank_code',
                        isEqualTo: _model.activeBankSearch != ''
                            ? _model.activeBankSearch
                            : null,
                      )
                      .where(
                        'status',
                        isEqualTo: _model.cashOnlyFilter != ''
                            ? _model.cashOnlyFilter
                            : null,
                      ),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  List<AtmsRecord> mapAtmsRecordList = snapshot.data!;

                  return Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (_model.myRealLocation == null)
                          Expanded(
                            child: wrapWithModel(
                              model: _model.loadingModel,
                              updateCallback: () => safeSetState(() {}),
                              child: LoadingWidget(),
                            ),
                          ),
                        if (_model.myRealLocation != null)
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            child: custom_widgets.FeehaAtmMap(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              atmLocations: mapAtmsRecordList
                                  .map((e) => e.location)
                                  .withoutNulls
                                  .toList(),
                              atmStatuses: mapAtmsRecordList
                                  .map((e) => e.status)
                                  .toList(),
                              userLocation: _model.myRealLocation,
                              onMarkerTap: (clickedIndex) async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: AtmDetailsSheetWidget(
                                          atmData: mapAtmsRecordList
                                              .elementAtOrNull(clickedIndex)!,
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Container(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 32.0, 24.0, 32.0),
                  child: Container(
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).surface80,
                        borderRadius: BorderRadius.circular(36.0),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).surface30,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 16.0, 8.0),
                        child: Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(SearchWidget.routeName);
                                },
                                child: Icon(
                                  Icons.arrow_back_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                              ),
                              Expanded(
                                child: FlutterFlowDropDown<String>(
                                  controller:
                                      _model.searchFieldValueController ??=
                                          FormFieldController<String>(null),
                                  options: [
                                    FFLocalizations.of(context).getText(
                                      'i30yyg1e' /* Banque Misr */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'cm6hy29j' /* Banque du Caire */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'hx4gznb9' /* National Bank of Egypt ( NBE ) */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'xun2hg2a' /* Commercial International Bank ... */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'ruyk4een' /* QNB */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'b6yc1pjz' /* Alexbank */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'p2wnfavy' /* Housing and Development Bank (... */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'kov2yf26' /* Egyptian Gulf Bank (EG-BANK) */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'crsm0yut' /* Suez Canal Bank */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'sihjxcuz' /* The United Bank of Egypt */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '2tm7bpaq' /* HSBC Egypt */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'raym42az' /* First Abu Dhabi Bank (FAB Misr... */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '9fy73eu1' /* Emirates NBD */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '54zme5ia' /* Crédit Agricole Egypt */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '7gbxjjnl' /* Arab International Bank (AIB) */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '6mdyx8gb' /* Arab Bank Egypt */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '1ftkbqdq' /* National Bank of Kuwait (NBK) */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'xexlhhh7' /* Al Ahli Bank of Kuwait (ABK) */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'tbatyjvy' /* Mashreq Bank */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'h4e0i4v7' /* Bank ABC */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'sr83m9ph' /* Attijariwafa Bank Egypt */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'ywg5dkyo' /* Abu Dhabi Islamic Bank (ADIB E... */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'a7k0a1sh' /* Faisal Islamic Bank of Egypt */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'szu06s0b' /* Al Baraka Bank Egypt */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'jyx07vhp' /* KFH Egypt */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '3kcbl7at' /* Agricultural Bank of Egypt (AB... */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      't9eekwvb' /* MIDBANK */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '63xmgfgw' /* saib Bank */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'm5baodus' /* Arab African International  */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '0vdn47jc' /* Bank NXT */,
                                    )
                                  ],
                                  onChanged: (val) => safeSetState(
                                      () => _model.searchFieldValue = val),
                                  width: 200.0,
                                  height: 40.0,
                                  searchHintTextStyle:
                                      FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                  searchTextStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    'j79tobxj' /* Search banks or ATMs... */,
                                  ),
                                  searchHintText:
                                      FFLocalizations.of(context).getText(
                                    'f41uiqkf' /* Search banks or ATMs... */,
                                  ),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor:
                                      FlutterFlowTheme.of(context).transparent,
                                  elevation: 2.0,
                                  borderColor: Colors.transparent,
                                  borderWidth: 0.0,
                                  borderRadius: 8.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  hidesUnderline: true,
                                  isOverButton: false,
                                  isSearchable: true,
                                  isMultiSelect: false,
                                ),
                              ),
                            ].divide(SizedBox(width: 16.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.98, 0.98),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(ReportHistoryWidget.routeName);

                  FFAppState().lastSeenReports = getCurrentTimestamp;
                  safeSetState(() {});
                },
                child: Container(
                  width: 48.2,
                  height: 48.59,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      FFAppState().globalReportsCount.toString(),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontStyle,
                            ),
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
