import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/footer/footer_widget.dart';
import '/components/mobile/app_bar_mobile/app_bar_mobile_widget.dart';
import '/components/mobile/navbar_mobile/navbar_mobile_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'leaderboard_model.dart';
export 'leaderboard_model.dart';

class LeaderboardWidget extends StatefulWidget {
  const LeaderboardWidget({
    super.key,
    String? coinCategory,
  }) : coinCategory = coinCategory ?? '';

  final String coinCategory;

  @override
  State<LeaderboardWidget> createState() => _LeaderboardWidgetState();
}

class _LeaderboardWidgetState extends State<LeaderboardWidget> {
  late LeaderboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeaderboardModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Leaderboard'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LEADERBOARD_Leaderboard_ON_INIT_STATE');
      logFirebaseEvent('Leaderboard_update_app_state');
      FFAppState().currentPageName = 'Leaderboard';
      safeSetState(() {});
      logFirebaseEvent('Leaderboard_set_dark_mode_settings');
      setDarkModeSetting(context, ThemeMode.dark);
      logFirebaseEvent('Leaderboard_update_page_state');
      _model.isloading = true;
      safeSetState(() {});
      await Future.wait([
        Future(() async {
          logFirebaseEvent('Leaderboard_backend_call');
          _model.trendingCoin = await TrendingCoinCall.call();

          if ((_model.trendingCoin?.succeeded ?? true)) {
            logFirebaseEvent('Leaderboard_update_page_state');
            _model.trending = (getJsonField(
              (_model.trendingCoin?.jsonBody ?? ''),
              r'''$.data''',
              true,
            )!
                    .toList()
                    .map<CoinDataStruct?>(CoinDataStruct.maybeFromMap)
                    .toList() as Iterable<CoinDataStruct?>)
                .withoutNulls
                .toList()
                .cast<CoinDataStruct>();
            safeSetState(() {});
          }
        }),
        Future(() async {
          logFirebaseEvent('Leaderboard_backend_call');
          _model.mostVisitedCoin = await MostVisitedCoinCall.call();

          if ((_model.mostVisitedCoin?.succeeded ?? true)) {
            logFirebaseEvent('Leaderboard_update_page_state');
            _model.mostVisited = (getJsonField(
              (_model.mostVisitedCoin?.jsonBody ?? ''),
              r'''$.data''',
              true,
            )!
                    .toList()
                    .map<CoinDataStruct?>(CoinDataStruct.maybeFromMap)
                    .toList() as Iterable<CoinDataStruct?>)
                .withoutNulls
                .toList()
                .cast<CoinDataStruct>();
            safeSetState(() {});
          }
        }),
        Future(() async {
          logFirebaseEvent('Leaderboard_backend_call');
          _model.recentlyAddedCoin = await RecentlyAddedCoinCall.call();

          if ((_model.recentlyAddedCoin?.succeeded ?? true)) {
            logFirebaseEvent('Leaderboard_update_page_state');
            _model.recentlyAdded = (getJsonField(
              (_model.recentlyAddedCoin?.jsonBody ?? ''),
              r'''$.data''',
              true,
            )!
                    .toList()
                    .map<CoinDataStruct?>(CoinDataStruct.maybeFromMap)
                    .toList() as Iterable<CoinDataStruct?>)
                .withoutNulls
                .toList()
                .cast<CoinDataStruct>();
            safeSetState(() {});
          }
        }),
        Future(() async {
          logFirebaseEvent('Leaderboard_backend_call');
          _model.apiResultCoin = await PriceCall.call();

          if ((_model.apiResultCoin?.succeeded ?? true)) {
            logFirebaseEvent('Leaderboard_update_app_state');
            FFAppState().PriceCoin = (getJsonField(
              (_model.apiResultCoin?.jsonBody ?? ''),
              r'''$.data''',
              true,
            )!
                    .toList()
                    .map<CoinDataStruct?>(CoinDataStruct.maybeFromMap)
                    .toList() as Iterable<CoinDataStruct?>)
                .withoutNulls
                .toList()
                .cast<CoinDataStruct>();
            safeSetState(() {});
          } else {
            logFirebaseEvent('Leaderboard_alert_dialog');
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return WebViewAware(
                  child: AlertDialog(
                    title: Text((_model.apiResultCoin?.exceptionMessage ?? '')),
                    content:
                        Text((_model.apiResultCoin?.exceptionMessage ?? '')),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
                        child: const Text('Ok'),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        }),
      ]);
      logFirebaseEvent('Leaderboard_update_page_state');
      _model.isloading = false;
      safeSetState(() {});
    });

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
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
            ))
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset(
                  'assets/images/Frame_656_(1).jpg',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            if (responsiveVisibility(
              context: context,
              tabletLandscape: false,
              desktop: false,
            ))
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
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 15.0, 15.0, 15.0),
                            child: Builder(
                              builder: (context) {
                                final category = _model.categoryButton.toList();

                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(category.length,
                                      (categoryIndex) {
                                    final categoryItem =
                                        category[categoryIndex];
                                    return FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'LEADERBOARD_PAGE_TRENDING_BTN_ON_TAP');
                                        logFirebaseEvent('Button_navigate_to');

                                        context.goNamed(
                                          'Leaderboard',
                                          pathParameters: {
                                            'coinCategory': serializeParam(
                                              categoryItem,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: const TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      },
                                      text: categoryItem,
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: valueOrDefault<Color>(
                                          categoryItem == widget.coinCategory
                                              ? FlutterFlowTheme.of(context)
                                                  .customColor1
                                              : const Color(0x29000000),
                                          Colors.transparent,
                                        ),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: categoryItem ==
                                                      widget.coinCategory
                                                  ? FlutterFlowTheme.of(context)
                                                      .info
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: categoryItem ==
                                                  widget.coinCategory
                                              ? const Color(0x0000ADD8)
                                              : FlutterFlowTheme.of(context)
                                                  .secondary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    );
                                  }).divide(const SizedBox(width: 25.0)),
                                );
                              },
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              if ((_model.trendingCoin?.succeeded ?? true) &&
                                  (_model.mostVisitedCoin?.succeeded ?? true) &&
                                  (_model.recentlyAddedCoin?.succeeded ??
                                      true)) {
                                return Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.8,
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        150.0, 0.0, 150.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final children = () {
                                          if (widget.coinCategory ==
                                              'Trending') {
                                            return _model.trending;
                                          } else if (widget.coinCategory ==
                                              'Most Visited') {
                                            return _model.mostVisited;
                                          } else if (widget.coinCategory ==
                                              'Recently Added') {
                                            return _model.recentlyAdded;
                                          } else if (widget.coinCategory ==
                                              'Coins') {
                                            return FFAppState().PriceCoin;
                                          } else {
                                            return _model.trending;
                                          }
                                        }()
                                            .toList();

                                        return FlutterFlowDataTable<
                                            CoinDataStruct>(
                                          controller: _model
                                              .paginatedDataTableController1,
                                          data: children,
                                          numRows: valueOrDefault<int>(
                                            1000,
                                            1000,
                                          ),
                                          columnsBuilder: (onSortChanged) => [
                                            DataColumn2(
                                              label: DefaultTextStyle.merge(
                                                softWrap: true,
                                                child: Text(
                                                  '#',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              fixedWidth:
                                                  MediaQuery.sizeOf(context)
                                                          .width *
                                                      0.03,
                                            ),
                                            DataColumn2(
                                              label: DefaultTextStyle.merge(
                                                softWrap: true,
                                                child: Text(
                                                  'Name',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            DataColumn2(
                                              label: DefaultTextStyle.merge(
                                                softWrap: true,
                                                child: Text(
                                                  'Price',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            DataColumn2(
                                              label: DefaultTextStyle.merge(
                                                softWrap: true,
                                                child: Text(
                                                  '24h',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              fixedWidth:
                                                  MediaQuery.sizeOf(context)
                                                          .width *
                                                      0.08,
                                            ),
                                            DataColumn2(
                                              label: DefaultTextStyle.merge(
                                                softWrap: true,
                                                child: Text(
                                                  '7d',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              fixedWidth:
                                                  MediaQuery.sizeOf(context)
                                                          .width *
                                                      0.08,
                                            ),
                                            DataColumn2(
                                              label: DefaultTextStyle.merge(
                                                softWrap: true,
                                                child: Text(
                                                  '30d',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              fixedWidth:
                                                  MediaQuery.sizeOf(context)
                                                          .width *
                                                      0.08,
                                            ),
                                            DataColumn2(
                                              label: DefaultTextStyle.merge(
                                                softWrap: true,
                                                child: Text(
                                                  'Market Cap',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            DataColumn2(
                                              label: DefaultTextStyle.merge(
                                                softWrap: true,
                                                child: Text(
                                                  'Volume(24h)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            DataColumn2(
                                              label: DefaultTextStyle.merge(
                                                softWrap: true,
                                                child: Text(
                                                  'Last 7 Days',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                          dataRowBuilder: (childrenItem,
                                                  childrenIndex,
                                                  selected,
                                                  onSelectChanged) =>
                                              DataRow(
                                            cells: [
                                              Text(
                                                valueOrDefault<String>(
                                                  (childrenIndex + 1)
                                                      .toString(),
                                                  '1',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                childrenItem.name,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '\$',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Text(
                                                    functions.formatDoublePrice(
                                                        valueOrDefault<double>(
                                                      childrenItem
                                                          .quote.usd.price,
                                                      0.0,
                                                    )),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                '${valueOrDefault<String>(
                                                  formatNumber(
                                                    childrenItem.quote.usd
                                                        .percentChange24h,
                                                    formatType:
                                                        FormatType.decimal,
                                                    decimalType:
                                                        DecimalType.automatic,
                                                  ),
                                                  '10%',
                                                )}%',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: childrenItem
                                                                  .quote
                                                                  .usd
                                                                  .percentChange24h <=
                                                              0.0
                                                          ? const Color(0xFFFF0000)
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                              Text(
                                                '${valueOrDefault<String>(
                                                  formatNumber(
                                                    childrenItem.quote.usd
                                                        .percentChange7d,
                                                    formatType:
                                                        FormatType.decimal,
                                                    decimalType:
                                                        DecimalType.automatic,
                                                  ),
                                                  '10%',
                                                )}%',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: childrenItem
                                                                  .quote
                                                                  .usd
                                                                  .percentChange7d <=
                                                              0.0
                                                          ? const Color(0xFFFF0000)
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                              Text(
                                                '${valueOrDefault<String>(
                                                  formatNumber(
                                                    childrenItem.quote.usd
                                                        .percentChange30d,
                                                    formatType:
                                                        FormatType.decimal,
                                                    decimalType:
                                                        DecimalType.automatic,
                                                  ),
                                                  '19%',
                                                )}%',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: childrenItem
                                                                  .quote
                                                                  .usd
                                                                  .percentChange30d <=
                                                              0.0
                                                          ? const Color(0xFFFF0000)
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                              Text(
                                                formatNumber(
                                                  childrenItem
                                                      .quote.usd.marketCap,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                  currency: '',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                formatNumber(
                                                  childrenItem
                                                      .circulatingSupply,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                  currency: '',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              SizedBox(
                                                width: 370.0,
                                                height: 230.0,
                                                child: FlutterFlowLineChart(
                                                  data: [
                                                    FFLineChartData(
                                                      xData: _model.xlist,
                                                      yData: functions
                                                          .createListFromTwoVariable(
                                                              valueOrDefault<
                                                                  double>(
                                                                childrenItem
                                                                    .quote
                                                                    .usd
                                                                    .percentChange24h,
                                                                0.0,
                                                              ),
                                                              valueOrDefault<
                                                                  double>(
                                                                childrenItem
                                                                    .quote
                                                                    .usd
                                                                    .percentChange7d,
                                                                1.0,
                                                              )),
                                                      settings:
                                                          LineChartBarData(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        barWidth: 2.0,
                                                        isCurved: true,
                                                        dotData: const FlDotData(
                                                            show: false),
                                                        belowBarData:
                                                            BarAreaData(
                                                          show: true,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor1,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                  chartStylingInfo:
                                                      const ChartStylingInfo(
                                                    backgroundColor:
                                                        Color(0x0014181B),
                                                    showBorder: false,
                                                  ),
                                                  axisBounds: const AxisBounds(),
                                                  xAxisLabelInfo: const AxisLabelInfo(
                                                    reservedSize: 32.0,
                                                  ),
                                                  yAxisLabelInfo: const AxisLabelInfo(
                                                    reservedSize: 40.0,
                                                  ),
                                                ),
                                              ),
                                            ].map((c) => DataCell(c)).toList(),
                                          ),
                                          paginated: true,
                                          selectable: false,
                                          hidePaginator: false,
                                          showFirstLastButtons: true,
                                          width: double.infinity,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              1.0,
                                          headingRowHeight: 56.0,
                                          dataRowHeight: 48.0,
                                          columnSpacing: 20.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          addHorizontalDivider: true,
                                          addTopAndBottomDivider: false,
                                          hideDefaultHorizontalDivider: false,
                                          horizontalDividerThickness: 1.0,
                                          addVerticalDivider: false,
                                        );
                                      },
                                    ),
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 150.0, 0.0, 150.0),
                                  child: Lottie.asset(
                                    'assets/lottie_animations/Animation_-_1716052348383.json',
                                    width: 200.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                    animate: true,
                                  ),
                                );
                              }
                            },
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
              ),
            if (responsiveVisibility(
              context: context,
              tabletLandscape: false,
              desktop: false,
            ))
              SingleChildScrollView(
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
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          15.0, 15.0, 15.0, 15.0),
                      child: Builder(
                        builder: (context) {
                          final category = _model.categoryButton.toList();

                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(category.length,
                                  (categoryIndex) {
                                final categoryItem = category[categoryIndex];
                                return FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'LEADERBOARD_PAGE_TRENDING_BTN_ON_TAP');
                                    logFirebaseEvent('Button_navigate_to');

                                    context.goNamed(
                                      'Leaderboard',
                                      pathParameters: {
                                        'coinCategory': serializeParam(
                                          categoryItem,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  },
                                  text: categoryItem,
                                  options: FFButtonOptions(
                                    height: 30.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: valueOrDefault<Color>(
                                      categoryItem == widget.coinCategory
                                          ? FlutterFlowTheme.of(context)
                                              .customColor1
                                          : const Color(0x29000000),
                                      Colors.transparent,
                                    ),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: categoryItem ==
                                                  widget.coinCategory
                                              ? FlutterFlowTheme.of(context)
                                                  .info
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 1.0,
                                    borderSide: BorderSide(
                                      color:
                                          categoryItem == widget.coinCategory
                                              ? const Color(0x0000ADD8)
                                              : FlutterFlowTheme.of(context)
                                                  .secondary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                );
                              }).divide(const SizedBox(width: 25.0)),
                            ),
                          );
                        },
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        if ((_model.trendingCoin?.succeeded ?? true) &&
                            (_model.mostVisitedCoin?.succeeded ?? true) &&
                            (_model.recentlyAddedCoin?.succeeded ?? true)) {
                          return Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 95.0),
                              child: Builder(
                                builder: (context) {
                                  final children = () {
                                    if (widget.coinCategory == 'Trending') {
                                      return _model.trending;
                                    } else if (widget.coinCategory ==
                                        'Most Visited') {
                                      return _model.mostVisited;
                                    } else if (widget.coinCategory ==
                                        'Recently Added') {
                                      return _model.recentlyAdded;
                                    } else {
                                      return _model.trending;
                                    }
                                  }()
                                      .toList();

                                  return FlutterFlowDataTable<CoinDataStruct>(
                                    controller:
                                        _model.paginatedDataTableController2,
                                    data: children,
                                    numRows: _model.trending.length,
                                    columnsBuilder: (onSortChanged) => [
                                      DataColumn2(
                                        label: DefaultTextStyle.merge(
                                          softWrap: true,
                                          child: Text(
                                            '#',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        fixedWidth:
                                            MediaQuery.sizeOf(context).width *
                                                0.02,
                                      ),
                                      DataColumn2(
                                        label: DefaultTextStyle.merge(
                                          softWrap: true,
                                          child: Text(
                                            'Name',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        fixedWidth:
                                            MediaQuery.sizeOf(context).width *
                                                0.2,
                                      ),
                                      DataColumn2(
                                        label: DefaultTextStyle.merge(
                                          softWrap: true,
                                          child: Text(
                                            'Price',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        fixedWidth:
                                            MediaQuery.sizeOf(context).width *
                                                0.25,
                                      ),
                                      DataColumn2(
                                        label: DefaultTextStyle.merge(
                                          softWrap: true,
                                          child: Text(
                                            '24h',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        fixedWidth:
                                            MediaQuery.sizeOf(context).width *
                                                0.15,
                                      ),
                                      DataColumn2(
                                        label: DefaultTextStyle.merge(
                                          softWrap: true,
                                          child: Text(
                                            '7d',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        fixedWidth:
                                            MediaQuery.sizeOf(context).width *
                                                0.15,
                                      ),
                                      DataColumn2(
                                        label: DefaultTextStyle.merge(
                                          softWrap: true,
                                          child: Text(
                                            '30d',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        fixedWidth:
                                            MediaQuery.sizeOf(context).width *
                                                0.15,
                                      ),
                                    ],
                                    dataRowBuilder: (childrenItem,
                                            childrenIndex,
                                            selected,
                                            onSelectChanged) =>
                                        DataRow(
                                      cells: [
                                        Text(
                                          valueOrDefault<String>(
                                            (childrenIndex + 1).toString(),
                                            '1',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Text(
                                          childrenItem.name,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              '\$',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              functions.formatDoublePrice(
                                                  valueOrDefault<double>(
                                                childrenItem.quote.usd.price,
                                                0.0,
                                              )),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '${valueOrDefault<String>(
                                            formatNumber(
                                              childrenItem
                                                  .quote.usd.percentChange24h,
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.automatic,
                                            ),
                                            '10%',
                                          )}%',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: childrenItem.quote.usd
                                                            .percentChange24h <=
                                                        0.0
                                                    ? const Color(0xFFFF0000)
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Text(
                                          '${valueOrDefault<String>(
                                            formatNumber(
                                              childrenItem
                                                  .quote.usd.percentChange7d,
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.automatic,
                                            ),
                                            '10%',
                                          )}%',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: childrenItem.quote.usd
                                                            .percentChange7d <=
                                                        0.0
                                                    ? const Color(0xFFFF0000)
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Text(
                                          '${valueOrDefault<String>(
                                            formatNumber(
                                              childrenItem
                                                  .quote.usd.percentChange30d,
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.automatic,
                                            ),
                                            '19%',
                                          )}%',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: childrenItem.quote.usd
                                                            .percentChange30d <=
                                                        0.0
                                                    ? const Color(0xFFFF0000)
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].map((c) => DataCell(c)).toList(),
                                    ),
                                    paginated: true,
                                    selectable: false,
                                    hidePaginator: false,
                                    showFirstLastButtons: true,
                                    width: double.infinity,
                                    height:
                                        MediaQuery.sizeOf(context).height * 1.0,
                                    headingRowHeight: 56.0,
                                    dataRowHeight: 48.0,
                                    columnSpacing: 20.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                    addHorizontalDivider: true,
                                    addTopAndBottomDivider: false,
                                    hideDefaultHorizontalDivider: false,
                                    horizontalDividerThickness: 1.0,
                                    addVerticalDivider: false,
                                  );
                                },
                              ),
                            ),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 150.0, 0.0, 150.0),
                            child: Lottie.asset(
                              'assets/lottie_animations/Animation_-_1716052348383.json',
                              width: 200.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                              animate: true,
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            if (responsiveVisibility(
              context: context,
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
