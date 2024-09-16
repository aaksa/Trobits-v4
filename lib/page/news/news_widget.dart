import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/footer/footer_widget.dart';
import '/components/mobile/app_bar_mobile/app_bar_mobile_widget.dart';
import '/components/mobile/navbar_mobile/navbar_mobile_widget.dart';
import '/components/mobile/news_widget_c_m_c_mobile/news_widget_c_m_c_mobile_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/news_widget_c_m_c/news_widget_c_m_c_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'news_model.dart';
export 'news_model.dart';

class NewsWidget extends StatefulWidget {
  const NewsWidget({super.key});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  late NewsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'News'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('NEWS_PAGE_News_ON_INIT_STATE');
      logFirebaseEvent('News_update_app_state');
      FFAppState().currentPageName = 'News';
      safeSetState(() {});
      await Future.wait([
        Future(() async {
          logFirebaseEvent('News_backend_call');
          _model.apiResultCoin = await PriceCall.call();

          if ((_model.apiResultCoin?.succeeded ?? true)) {
            logFirebaseEvent('News_update_app_state');
            FFAppState().PriceCoin = (functions
                    .filterCoins(getJsonField(
                      (_model.apiResultCoin?.jsonBody ?? ''),
                      r'''$.data''',
                      true,
                    )!)!
                    .toList()
                    .map<CoinDataStruct?>(CoinDataStruct.maybeFromMap)
                    .toList() as Iterable<CoinDataStruct?>)
                .withoutNulls
                .toList()
                .cast<CoinDataStruct>();
            safeSetState(() {});
          } else {
            logFirebaseEvent('News_alert_dialog');
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  title: Text((_model.apiResultCoin?.exceptionMessage ?? '')),
                  content:
                      Text((_model.apiResultCoin?.jsonBody ?? '').toString()),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: const Text('Ok'),
                    ),
                  ],
                );
              },
            );
          }
        }),
        Future(() async {
          logFirebaseEvent('News_backend_call');
          _model.apiResultTrendingCoin = await TrendingCoinCall.call();

          if ((_model.apiResultTrendingCoin?.succeeded ?? true)) {
            logFirebaseEvent('News_update_app_state');
            FFAppState().TrendingCoin = (getJsonField(
              (_model.apiResultTrendingCoin?.jsonBody ?? ''),
              r'''$.data''',
              true,
            )!
                    .toList()
                    .map<CoinDataStruct?>(CoinDataStruct.maybeFromMap)
                    .toList() as Iterable<CoinDataStruct?>)
                .withoutNulls
                .take(5)
                .toList()
                .toList()
                .cast<CoinDataStruct>();
            safeSetState(() {});
          }
        }),
        Future(() async {
          logFirebaseEvent('News_backend_call');
          _model.apiResultMostVisitedCoin = await MostVisitedCoinCall.call();

          if ((_model.apiResultMostVisitedCoin?.succeeded ?? true)) {
            logFirebaseEvent('News_update_app_state');
            FFAppState().MostVisitedCoin = (getJsonField(
              (_model.apiResultMostVisitedCoin?.jsonBody ?? ''),
              r'''$.data''',
              true,
            )!
                    .toList()
                    .map<CoinDataStruct?>(CoinDataStruct.maybeFromMap)
                    .toList() as Iterable<CoinDataStruct?>)
                .withoutNulls
                .take(5)
                .toList()
                .toList()
                .cast<CoinDataStruct>();
            safeSetState(() {});
          }
        }),
        Future(() async {
          logFirebaseEvent('News_backend_call');
          _model.apiResultNewCoin = await RecentlyAddedCoinCall.call();

          if ((_model.apiResultNewCoin?.succeeded ?? true)) {
            logFirebaseEvent('News_update_app_state');
            FFAppState().RecentlyAddedCoin = (getJsonField(
              (_model.apiResultNewCoin?.jsonBody ?? ''),
              r'''$.data''',
              true,
            )!
                    .toList()
                    .map<CoinDataStruct?>(CoinDataStruct.maybeFromMap)
                    .toList() as Iterable<CoinDataStruct?>)
                .withoutNulls
                .take(5)
                .toList()
                .toList()
                .cast<CoinDataStruct>();
            safeSetState(() {});
          }
        }),
      ]);
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF030B15),
        body: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: Image.asset(
                'assets/images/Frame_656.jpg',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
            ))
              SingleChildScrollView(
                controller: _model.columnController1,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    StickyHeader(
                      overlapHeaders: false,
                      header: wrapWithModel(
                        model: _model.navBarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: const NavBarWidget(),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Builder(
                                builder: (context) {
                                  if (FFAppState().PriceCoin.isNotEmpty) {
                                    return Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.05,
                                      decoration: BoxDecoration(
                                        color: const Color(0x582F2F2F),
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child:
                                                    FlutterFlowDropDown<String>(
                                                  controller: _model
                                                          .dropDownValueController ??=
                                                      FormFieldController<
                                                          String>(
                                                    _model.dropDownValue ??=
                                                        'Price',
                                                  ),
                                                  options: const [
                                                    'Price',
                                                    'Recently Added',
                                                    'Trending',
                                                    'Most Visited'
                                                  ],
                                                  onChanged: (val) async {
                                                    safeSetState(() => _model
                                                        .dropDownValue = val);
                                                    logFirebaseEvent(
                                                        'NEWS_DropDown_j1u9z7q7_ON_FORM_WIDGET_SE');
                                                    logFirebaseEvent(
                                                        'DropDown_update_page_state');
                                                    _model.nameSelectedCoinNavBar =
                                                        _model.dropDownValue!;
                                                    safeSetState(() {});
                                                    logFirebaseEvent(
                                                        'DropDown_refresh_database_request');
                                                    safeSetState(() => _model
                                                            .apiRequestCompleter2 =
                                                        null);
                                                    await _model
                                                        .waitForApiRequestCompleted2();
                                                  },
                                                  width: 125.0,
                                                  height: 25.0,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  hintText: 'Category',
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    size: 20.0,
                                                  ),
                                                  fillColor: Colors.black,
                                                  elevation: 2.0,
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderWidth: 2.0,
                                                  borderRadius: 0.0,
                                                  margin: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 4.0, 10.0, 4.0),
                                                  hidesUnderline: true,
                                                  isOverButton: false,
                                                  isSearchable: false,
                                                  isMultiSelect: false,
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 8.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final listOfCoins = () {
                                                        if (_model
                                                                .nameSelectedCoinNavBar ==
                                                            'Price') {
                                                          return FFAppState()
                                                              .PriceCoin;
                                                        } else if (_model
                                                                .nameSelectedCoinNavBar ==
                                                            'Most Visited') {
                                                          return FFAppState()
                                                              .MostVisitedCoin;
                                                        } else if (_model
                                                                .nameSelectedCoinNavBar ==
                                                            'Recently Added') {
                                                          return FFAppState()
                                                              .RecentlyAddedCoin;
                                                        } else if (_model
                                                                .nameSelectedCoinNavBar ==
                                                            'Trending') {
                                                          return FFAppState()
                                                              .TrendingCoin;
                                                        } else {
                                                          return FFAppState()
                                                              .PriceCoin;
                                                        }
                                                      }()
                                                          .toList();

                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: List.generate(
                                                            listOfCoins.length,
                                                            (listOfCoinsIndex) {
                                                          final listOfCoinsItem =
                                                              listOfCoins[
                                                                  listOfCoinsIndex];
                                                          return Expanded(
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          RichText(
                                                                            textScaler:
                                                                                MediaQuery.of(context).textScaler,
                                                                            text:
                                                                                TextSpan(
                                                                              children: [
                                                                                TextSpan(
                                                                                  text: valueOrDefault<String>(
                                                                                    listOfCoinsItem.symbol,
                                                                                    'Coin Name',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Readex Pro',
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                                TextSpan(
                                                                                  text: ' : ',
                                                                                  style: GoogleFonts.getFont(
                                                                                    'Outfit',
                                                                                    color: FlutterFlowTheme.of(context).customColor1,
                                                                                    fontWeight: FontWeight.w800,
                                                                                  ),
                                                                                ),
                                                                                TextSpan(
                                                                                  text: functions.formatDoublePrice(valueOrDefault<double>(
                                                                                    listOfCoinsItem.quote.usd.price,
                                                                                    0000.0,
                                                                                  )),
                                                                                  style: GoogleFonts.getFont(
                                                                                    'Readex Pro',
                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                    fontWeight: FontWeight.bold,
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                                )
                                                                              ],
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Readex Pro',
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 20.0,
                                                                  child:
                                                                      VerticalDivider(
                                                                    width: 5.0,
                                                                    thickness:
                                                                        1.0,
                                                                    color: Color(
                                                                        0x8000ADD8),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              if (_model
                                                      .nameSelectedCoinNavBar !=
                                                  'Price')
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 0.0, 15.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'NEWS_PAGE_Icon_usfougx0_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Icon_navigate_to');

                                                      context.pushNamed(
                                                        'Leaderboard',
                                                        pathParameters: {
                                                          'coinCategory':
                                                              serializeParam(
                                                            _model
                                                                .nameSelectedCoinNavBar,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Icon(
                                                      Icons.more_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                          const Divider(
                                            height: 3.0,
                                            thickness: 1.0,
                                            color: Color(0x7F00ADD8),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        'Loading...',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: const Color(0x81F1F4F8),
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    );
                                  }
                                },
                              ),
                              SingleChildScrollView(
                                primary: false,
                                controller: _model.columnController2,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 35.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    110.0, 100.0, 110.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: const Color(0x244B39EF),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        50.0, 0.0, 50.0, 10.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    25.0,
                                                                    0.0,
                                                                    25.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Crypto Exchange News',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    fontSize:
                                                                        18.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                            Text(
                                                              'Insight into the biggest crypto industry',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    fontSize:
                                                                        26.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                '\n',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              height: 10.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    150.0, 25.0, 150.0, 5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  flex: 4,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Text(
                                                          'News',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .displaySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Text(
                                                          'Insights into the biggest events shaping the crypto industry.',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 0.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .textController1,
                                                      focusNode: _model
                                                          .textFieldFocusNode1,
                                                      onFieldSubmitted:
                                                          (_) async {
                                                        logFirebaseEvent(
                                                            'NEWS_TextField_exfg1zh9_ON_TEXTFIELD_SUB');
                                                        logFirebaseEvent(
                                                            'TextField_refresh_database_request');
                                                        safeSetState(() => _model
                                                                .apiRequestCompleter2 =
                                                            null);
                                                        await _model
                                                            .waitForApiRequestCompleted2();
                                                      },
                                                      autofocus: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'Search News',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        prefixIcon: Icon(
                                                          Icons.search,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor1,
                                                        ),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      validator: _model
                                                          .textController1Validator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    210.0, 20.0, 210.0, 0.0),
                                            child:
                                                FutureBuilder<ApiCallResponse>(
                                              future:
                                                  (_model.apiRequestCompleter2 ??=
                                                          Completer<
                                                              ApiCallResponse>()
                                                            ..complete(
                                                                NewsLatestCall
                                                                    .call(
                                                              page:
                                                                  _model.index,
                                                              search: _model
                                                                  .textController1
                                                                  .text,
                                                            )))
                                                      .future,
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final listViewNewsLatestResponse =
                                                    snapshot.data!;

                                                return Builder(
                                                  builder: (context) {
                                                    final eachNewsData =
                                                        ((getJsonField(
                                                                  listViewNewsLatestResponse
                                                                      .jsonBody,
                                                                  r'''$.data''',
                                                                  true,
                                                                )
                                                                        ?.toList()
                                                                        .map<CryptonewsStruct?>(
                                                                            CryptonewsStruct.maybeFromMap)
                                                                        .toList() as Iterable<CryptonewsStruct?>)
                                                                    .withoutNulls
                                                                    .toList() ??
                                                                [])
                                                            .take(10)
                                                            .toList();

                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          eachNewsData.length,
                                                      itemBuilder: (context,
                                                          eachNewsDataIndex) {
                                                        final eachNewsDataItem =
                                                            eachNewsData[
                                                                eachNewsDataIndex];
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      20.0,
                                                                      0.0),
                                                          child:
                                                              NewsWidgetCMCWidget(
                                                            key: Key(
                                                                'Keyofm_${eachNewsDataIndex}_of_${eachNewsData.length}'),
                                                            newsData:
                                                                eachNewsDataItem,
                                                          ),
                                                        );
                                                      },
                                                      controller: _model
                                                          .listViewController,
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    210.0, 20.0, 210.0, 20.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                if (_model.index! > 1)
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    borderRadius: 8.0,
                                                    borderWidth: 1.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .customColor1,
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_left_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'NEWS_keyboard_arrow_left_sharp_ICN_ON_TA');
                                                      logFirebaseEvent(
                                                          'IconButton_update_page_state');
                                                      _model.index =
                                                          _model.index! + -1;
                                                      safeSetState(() {});
                                                      logFirebaseEvent(
                                                          'IconButton_refresh_database_request');
                                                      safeSetState(() => _model
                                                              .apiRequestCompleter2 =
                                                          null);
                                                      await _model
                                                          .waitForApiRequestCompleted2();
                                                      logFirebaseEvent(
                                                          'IconButton_scroll_to');
                                                      await _model
                                                          .columnController1
                                                          ?.animateTo(
                                                        0,
                                                        duration: const Duration(
                                                            milliseconds: 100),
                                                        curve: Curves.ease,
                                                      );
                                                    },
                                                  ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        _model.index
                                                            ?.toString(),
                                                        '1',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                fontSize: 32.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  borderRadius: 8.0,
                                                  borderWidth: 1.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .customColor1,
                                                  icon: Icon(
                                                    Icons.navigate_next,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'NEWS_PAGE_navigate_next_ICN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'IconButton_update_page_state');
                                                    _model.index =
                                                        _model.index! + 1;
                                                    safeSetState(() {});
                                                    logFirebaseEvent(
                                                        'IconButton_refresh_database_request');
                                                    safeSetState(() => _model
                                                            .apiRequestCompleter2 =
                                                        null);
                                                    await _model
                                                        .waitForApiRequestCompleted2();
                                                    logFirebaseEvent(
                                                        'IconButton_scroll_to');
                                                    await _model
                                                        .columnController1
                                                        ?.animateTo(
                                                      0,
                                                      duration: const Duration(
                                                          milliseconds: 100),
                                                      curve: Curves.ease,
                                                    );
                                                  },
                                                ),
                                              ].divide(const SizedBox(width: 25.0)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.footerModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: const FooterWidget(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            if (responsiveVisibility(
              context: context,
              tabletLandscape: false,
              desktop: false,
            ))
              SingleChildScrollView(
                controller: _model.mobile,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    wrapWithModel(
                      model: _model.appBarMobileModel,
                      updateCallback: () => safeSetState(() {}),
                      child: const AppBarMobileWidget(),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'NEWS',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 23.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: _model.textController2,
                              focusNode: _model.textFieldFocusNode2,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textController2',
                                const Duration(milliseconds: 2000),
                                () async {
                                  logFirebaseEvent(
                                      'NEWS_TextField_gglhwejm_ON_TEXTFIELD_CHA');
                                  logFirebaseEvent(
                                      'TextField_refresh_database_request');
                                  safeSetState(
                                      () => _model.apiRequestCompleter1 = null);
                                  await _model.waitForApiRequestCompleted1();
                                },
                              ),
                              onFieldSubmitted: (_) async {
                                logFirebaseEvent(
                                    'NEWS_TextField_gglhwejm_ON_TEXTFIELD_SUB');
                                logFirebaseEvent(
                                    'TextField_refresh_database_request');
                                safeSetState(
                                    () => _model.apiRequestCompleter1 = null);
                                await _model.waitForApiRequestCompleted1();
                              },
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: 'Search News',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context).info,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                    ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color:
                                      FlutterFlowTheme.of(context).customColor1,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                              validator: _model.textController2Validator
                                  .asValidator(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 20.0),
                      child: FutureBuilder<ApiCallResponse>(
                        future: (_model.apiRequestCompleter1 ??=
                                Completer<ApiCallResponse>()
                                  ..complete(NewsLatestCall.call(
                                    page: _model.index,
                                    search: _model.textController2.text,
                                  )))
                            .future,
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          final lisMNewsLatestResponse = snapshot.data!;

                          return Builder(
                            builder: (context) {
                              final coins = ((getJsonField(
                                        lisMNewsLatestResponse.jsonBody,
                                        r'''$.data''',
                                        true,
                                      )
                                                  ?.toList()
                                                  .map<CryptonewsStruct?>(
                                                      CryptonewsStruct.maybeFromMap)
                                                  .toList()
                                              as Iterable<CryptonewsStruct?>)
                                          .withoutNulls
                                          .toList() ??
                                      [])
                                  .take(10)
                                  .toList();

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: coins.length,
                                itemBuilder: (context, coinsIndex) {
                                  final coinsItem = coins[coinsIndex];
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: NewsWidgetCMCMobileWidget(
                                      key: Key(
                                          'Keygrd_${coinsIndex}_of_${coins.length}'),
                                      newsData: coinsItem,
                                    ),
                                  );
                                },
                                controller: _model.lisM,
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 125.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (_model.index! > 1)
                            FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context).primary,
                              borderRadius: 8.0,
                              borderWidth: 1.0,
                              buttonSize: 46.0,
                              fillColor:
                                  FlutterFlowTheme.of(context).customColor1,
                              icon: Icon(
                                Icons.keyboard_arrow_left_sharp,
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'NEWS_keyboard_arrow_left_sharp_ICN_ON_TA');
                                logFirebaseEvent(
                                    'IconButton_update_page_state');
                                _model.index = _model.index! + -1;
                                safeSetState(() {});
                                logFirebaseEvent(
                                    'IconButton_refresh_database_request');
                                safeSetState(
                                    () => _model.apiRequestCompleter2 = null);
                                await _model.waitForApiRequestCompleted2();
                                logFirebaseEvent('IconButton_scroll_to');
                                await _model.columnController1?.animateTo(
                                  0,
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.ease,
                                );
                              },
                            ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  _model.index?.toString(),
                                  '1',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context).info,
                                      fontSize: 32.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderRadius: 8.0,
                            borderWidth: 1.0,
                            buttonSize: 46.0,
                            fillColor:
                                FlutterFlowTheme.of(context).customColor1,
                            icon: Icon(
                              Icons.navigate_next,
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'NEWS_PAGE_navigate_next_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_update_page_state');
                              _model.index = _model.index! + 1;
                              safeSetState(() {});
                              logFirebaseEvent(
                                  'IconButton_refresh_database_request');
                              safeSetState(
                                  () => _model.apiRequestCompleter2 = null);
                              await _model.waitForApiRequestCompleted2();
                              logFirebaseEvent('IconButton_scroll_to');
                              await _model.columnController1?.animateTo(
                                0,
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.ease,
                              );
                            },
                          ),
                        ].divide(const SizedBox(width: 25.0)),
                      ),
                    ),
                  ],
                ),
              ),
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
              tabletLandscape: false,
              desktop: false,
            ))
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navbarMobileModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const NavbarMobileWidget(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
