import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/components/mobile/app_bar_mobile/app_bar_mobile_widget.dart';
import '/components/mobile/navbar_mobile/navbar_mobile_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'news_widget.dart' show NewsWidget;
import 'package:flutter/material.dart';

class NewsModel extends FlutterFlowModel<NewsWidget> {
  ///  Local state fields for this page.

  int? index = 1;

  String nameSelectedCoinNavBar = 'Price';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Price)] action in News widget.
  ApiCallResponse? apiResultCoin;
  // Stores action output result for [Backend Call - API (TrendingCoin)] action in News widget.
  ApiCallResponse? apiResultTrendingCoin;
  // Stores action output result for [Backend Call - API (MostVisitedCoin)] action in News widget.
  ApiCallResponse? apiResultMostVisitedCoin;
  // Stores action output result for [Backend Call - API (RecentlyAddedCoin)] action in News widget.
  ApiCallResponse? apiResultNewCoin;
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Model for Footer component.
  late FooterModel footerModel;
  // State field(s) for Mobile widget.
  ScrollController? mobile;
  // Model for AppBar_Mobile component.
  late AppBarMobileModel appBarMobileModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  Completer<ApiCallResponse>? apiRequestCompleter1;
  // State field(s) for LisM widget.
  ScrollController? lisM;
  // Model for Navbar_Mobile component.
  late NavbarMobileModel navbarMobileModel;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    navBarModel = createModel(context, () => NavBarModel());
    columnController2 = ScrollController();
    listViewController = ScrollController();
    footerModel = createModel(context, () => FooterModel());
    mobile = ScrollController();
    appBarMobileModel = createModel(context, () => AppBarMobileModel());
    lisM = ScrollController();
    navbarMobileModel = createModel(context, () => NavbarMobileModel());
  }

  @override
  void dispose() {
    columnController1?.dispose();
    navBarModel.dispose();
    columnController2?.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    listViewController?.dispose();
    footerModel.dispose();
    mobile?.dispose();
    appBarMobileModel.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    lisM?.dispose();
    navbarMobileModel.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
