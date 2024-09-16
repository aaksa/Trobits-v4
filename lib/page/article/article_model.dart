import '/components/footer/footer_widget.dart';
import '/components/mobile/app_bar_mobile_back/app_bar_mobile_back_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'article_widget.dart' show ArticleWidget;
import 'package:flutter/material.dart';

class ArticleModel extends FlutterFlowModel<ArticleWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBar component.
  late NavBarModel navBarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Model for Footer component.
  late FooterModel footerModel;
  // Model for AppBar_Mobile_Back component.
  late AppBarMobileBackModel appBarMobileBackModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
    footerModel = createModel(context, () => FooterModel());
    appBarMobileBackModel = createModel(context, () => AppBarMobileBackModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    footerModel.dispose();
    appBarMobileBackModel.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
