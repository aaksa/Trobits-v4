import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'navbar_mobile_model.dart';
export 'navbar_mobile_model.dart';

class NavbarMobileWidget extends StatefulWidget {
  const NavbarMobileWidget({super.key});

  @override
  State<NavbarMobileWidget> createState() => _NavbarMobileWidgetState();
}

class _NavbarMobileWidgetState extends State<NavbarMobileWidget> {
  late NavbarMobileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarMobileModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible: responsiveVisibility(
        context: context,
        tabletLandscape: false,
        desktop: false,
      ),
      child: Align(
        alignment: const AlignmentDirectional(0.0, 1.0),
        child: Container(
          width: double.infinity,
          height: 55.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondary,
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 6.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('NAVBAR_MOBILE_Column_kfuxjbkv_ON_TAP');
                      logFirebaseEvent('Column_navigate_to');

                      context.pushNamed(
                        'Home',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.home,
                          color: valueOrDefault<Color>(
                            FFAppState().currentPageName == 'Home'
                                ? FlutterFlowTheme.of(context).info
                                : const Color(0x7FFFFFFF),
                            const Color(0x7FFFFFFF),
                          ),
                          size: 24.0,
                        ),
                        Text(
                          'Home',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: valueOrDefault<Color>(
                                      FFAppState().currentPageName == 'Home'
                                          ? FlutterFlowTheme.of(context).info
                                          : const Color(0x7FFFFFFF),
                                      const Color(0x7FFFFFFF),
                                    ),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('NAVBAR_MOBILE_Column_tzwqkapu_ON_TAP');
                      logFirebaseEvent('Column_navigate_to');

                      context.pushNamed(
                        'News',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.newspaper_sharp,
                          color: valueOrDefault<Color>(
                            FFAppState().currentPageName == 'News'
                                ? FlutterFlowTheme.of(context).info
                                : const Color(0x7FFFFFFF),
                            const Color(0x7FFFFFFF),
                          ),
                          size: 24.0,
                        ),
                        Text(
                          'News',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: valueOrDefault<Color>(
                                      FFAppState().currentPageName == 'News'
                                          ? FlutterFlowTheme.of(context).info
                                          : const Color(0x7FFFFFFF),
                                      const Color(0x7FFFFFFF),
                                    ),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('NAVBAR_MOBILE_Column_9xr2se5i_ON_TAP');
                      logFirebaseEvent('Column_navigate_to');

                      context.pushNamed(
                        'Leaderboard',
                        pathParameters: {
                          'coinCategory': serializeParam(
                            'Trending',
                            ParamType.String,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.leaderboard_sharp,
                          color: valueOrDefault<Color>(
                            FFAppState().currentPageName == 'Leaderboard'
                                ? FlutterFlowTheme.of(context).info
                                : const Color(0x7FFFFFFF),
                            const Color(0x7FFFFFFF),
                          ),
                          size: 24.0,
                        ),
                        Text(
                          'Leaderboard',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color: valueOrDefault<Color>(
                                  FFAppState().currentPageName == 'Leaderboard'
                                      ? FlutterFlowTheme.of(context).info
                                      : const Color(0x7FFFFFFF),
                                  const Color(0x7FFFFFFF),
                                ),
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
