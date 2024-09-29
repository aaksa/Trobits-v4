import '/components/footer/footer_widget.dart';
import '/components/mobile/app_bar_mobile/app_bar_mobile_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'learns_detail_widget.dart' show LearnsDetailWidget;
import 'package:flutter/material.dart';

class LearnsDetailModel extends FlutterFlowModel<LearnsDetailWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for AppBar_Mobile component.
  late AppBarMobileModel appBarMobileModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    appBarMobileModel = createModel(context, () => AppBarMobileModel());
    navBarModel = createModel(context, () => NavBarModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    appBarMobileModel.dispose();
    navBarModel.dispose();
    footerModel.dispose();
  }
}
