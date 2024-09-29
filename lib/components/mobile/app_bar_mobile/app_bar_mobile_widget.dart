import '/components/mobile/menu_mobile/menu_mobile_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'app_bar_mobile_model.dart';
export 'app_bar_mobile_model.dart';

class AppBarMobileWidget extends StatefulWidget {
  const AppBarMobileWidget({super.key});

  @override
  State<AppBarMobileWidget> createState() => _AppBarMobileWidgetState();
}

class _AppBarMobileWidgetState extends State<AppBarMobileWidget> {
  late AppBarMobileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppBarMobileModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(15.0, 5.0, 15.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('APP_BAR_MOBILE_Image_01v4x9my_ON_TAP');
                  logFirebaseEvent('Image_navigate_to');

                  context.goNamed('Home');
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Trobits_Logo_C1_(2).png',
                    width: 74.0,
                    height: 74.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
          Builder(
            builder: (context) => FlutterFlowIconButton(
              borderWidth: 1.0,
              buttonSize: 50.0,
              icon: Icon(
                Icons.menu,
                color: FlutterFlowTheme.of(context).secondary,
                size: 28.0,
              ),
              onPressed: () async {
                logFirebaseEvent('APP_BAR_MOBILE_COMP_menu_ICN_ON_TAP');
                logFirebaseEvent('IconButton_alert_dialog');
                await showDialog(
                  context: context,
                  builder: (dialogContext) {
                    return Dialog(
                      elevation: 0,
                      insetPadding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      alignment: const AlignmentDirectional(0.0, 0.0)
                          .resolve(Directionality.of(context)),
                      child: WebViewAware(
                        child: SizedBox(
                          height: double.infinity,
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          child: const MenuMobileWidget(),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
