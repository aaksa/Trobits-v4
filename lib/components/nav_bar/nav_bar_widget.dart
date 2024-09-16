import '/components/pop_up_menu/account_pop_up_menu/account_pop_up_menu_widget.dart';
import '/components/pop_up_menu/welcome_pop_up/welcome_pop_up_widget.dart';
import '/components/table_burn/table_burn_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late NavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());

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

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(25.0, 15.0, 25.0, 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/Trobits_Logo_C1_(2).png',
                        height: 75.0,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent('NAV_BAR_COMP_Text_esiflayd_ON_TAP');
                          logFirebaseEvent('Text_update_app_state');
                          FFAppState().indexNav = 0;
                          FFAppState().currentPageName = 'Home';
                          safeSetState(() {});
                          logFirebaseEvent('Text_navigate_to');

                          context.goNamed('Home');
                        },
                        child: Text(
                          'Home',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FFAppState().currentPageName == 'Home'
                                    ? FlutterFlowTheme.of(context).secondary
                                    : FlutterFlowTheme.of(context).info,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent('NAV_BAR_COMP_Text_qesr05d2_ON_TAP');
                          logFirebaseEvent('Text_update_app_state');
                          FFAppState().indexNav = 1;
                          safeSetState(() {});
                          logFirebaseEvent('Text_navigate_to');

                          context.goNamed('News');
                        },
                        child: Text(
                          'News',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FFAppState().currentPageName == 'News'
                                    ? FlutterFlowTheme.of(context).secondary
                                    : FlutterFlowTheme.of(context).info,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent('NAV_BAR_COMP_Text_85fvvol8_ON_TAP');
                          logFirebaseEvent('Text_navigate_to');

                          context.pushNamed('Article');

                          logFirebaseEvent('Text_update_app_state');
                          FFAppState().indexNav = 1;
                          safeSetState(() {});
                        },
                        child: Text(
                          'Articles',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FFAppState().currentPageName == 'Article'
                                    ? FlutterFlowTheme.of(context).secondary
                                    : FlutterFlowTheme.of(context).info,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ),
                    Builder(
                      builder: (context) => InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent('NAV_BAR_COMP_Text_xujom53g_ON_TAP');
                          logFirebaseEvent('Text_alert_dialog');
                          await showAlignedDialog(
                            context: context,
                            isGlobal: false,
                            avoidOverflow: true,
                            targetAnchor: const AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            followerAnchor: const AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            builder: (dialogContext) {
                              return const Material(
                                color: Colors.transparent,
                                child: WelcomePopUpWidget(),
                              );
                            },
                          );
                        },
                        child: Text(
                          'Welcome',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Builder(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'NAV_BAR_COMP_Text_td13nxzp_ON_TAP');
                            logFirebaseEvent('Text_alert_dialog');
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: const AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: SizedBox(
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.9,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.9,
                                    child: const TableBurnWidget(),
                                  ),
                                );
                              },
                            );
                          },
                          child: Text(
                            'Crypto Burn',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FFAppState().currentPageName ==
                                          'Crypto Burn'
                                      ? FlutterFlowTheme.of(context).secondary
                                      : FlutterFlowTheme.of(context).info,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent('NAV_BAR_COMP_Text_4alprcl9_ON_TAP');
                          logFirebaseEvent('Text_navigate_to');

                          context.goNamed(
                            'Leaderboard',
                            pathParameters: {
                              'coinCategory': serializeParam(
                                'Coins',
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Text(
                          'Price',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FFAppState().currentPageName == 'Price'
                                    ? FlutterFlowTheme.of(context).secondary
                                    : FlutterFlowTheme.of(context).info,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ),
                    if (responsiveVisibility(
                      context: context,
                      desktop: false,
                    ))
                      Flexible(
                        child: Builder(
                          builder: (context) => InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'NAV_BAR_COMP_Image_3b0iob20_ON_TAP');
                              logFirebaseEvent('Image_alert_dialog');
                              await showAlignedDialog(
                                context: context,
                                isGlobal: false,
                                avoidOverflow: true,
                                targetAnchor: const AlignmentDirectional(1.0, 1.0)
                                    .resolve(Directionality.of(context)),
                                followerAnchor: const AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                builder: (dialogContext) {
                                  return const Material(
                                    color: Colors.transparent,
                                    child: AccountPopUpMenuWidget(),
                                  );
                                },
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/image_2.png',
                                width: 42.0,
                                height: 42.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
