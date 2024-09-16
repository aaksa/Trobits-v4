import '/components/mobile/menu_mobile/menu_mobile_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'app_bar_mobile_back_model.dart';
export 'app_bar_mobile_back_model.dart';

class AppBarMobileBackWidget extends StatefulWidget {
  const AppBarMobileBackWidget({super.key});

  @override
  State<AppBarMobileBackWidget> createState() => _AppBarMobileBackWidgetState();
}

class _AppBarMobileBackWidgetState extends State<AppBarMobileBackWidget> {
  late AppBarMobileBackModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppBarMobileBackModel());

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
              FlutterFlowIconButton(
                borderWidth: 1.0,
                buttonSize: 45.0,
                icon: Icon(
                  Icons.chevron_left_outlined,
                  color: FlutterFlowTheme.of(context).customColor1,
                  size: 32.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('APP_BAR_MOBILE_BACK_chevron_left_outline');
                  logFirebaseEvent('IconButton_navigate_to');

                  context.goNamed('Home');
                },
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
                logFirebaseEvent('APP_BAR_MOBILE_BACK_COMP_menu_ICN_ON_TAP');
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
                      child: SizedBox(
                        height: double.infinity,
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        child: const MenuMobileWidget(),
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
