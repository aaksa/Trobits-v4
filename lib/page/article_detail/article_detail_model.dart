import '/components/footer/footer_widget.dart';
import '/components/mobile/app_bar_mobile_back/app_bar_mobile_back_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'article_detail_widget.dart' show ArticleDetailWidget;
import 'package:flutter/material.dart';

class ArticleDetailModel extends FlutterFlowModel<ArticleDetailWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBar component.
  late NavBarModel navBarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for Footer component.
  late FooterModel footerModel;
  // Model for AppBar_Mobile_Back component.
  late AppBarMobileBackModel appBarMobileBackModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
    footerModel = createModel(context, () => FooterModel());
    appBarMobileBackModel = createModel(context, () => AppBarMobileBackModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    footerModel.dispose();
    appBarMobileBackModel.dispose();
  }
}
