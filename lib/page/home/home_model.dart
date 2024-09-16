import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/footer/footer_widget.dart';
import '/components/mobile/app_bar_mobile/app_bar_mobile_widget.dart';
import '/components/mobile/navbar_mobile/navbar_mobile_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'home_widget.dart' show HomeWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  List<CoinDataStruct> coinCardData = [];
  void addToCoinCardData(CoinDataStruct item) => coinCardData.add(item);
  void removeFromCoinCardData(CoinDataStruct item) => coinCardData.remove(item);
  void removeAtIndexFromCoinCardData(int index) => coinCardData.removeAt(index);
  void insertAtIndexInCoinCardData(int index, CoinDataStruct item) =>
      coinCardData.insert(index, item);
  void updateCoinCardDataAtIndex(
          int index, Function(CoinDataStruct) updateFn) =>
      coinCardData[index] = updateFn(coinCardData[index]);

  bool? loadingCardWidget = true;

  List<CryptonewsStruct> newsData = [];
  void addToNewsData(CryptonewsStruct item) => newsData.add(item);
  void removeFromNewsData(CryptonewsStruct item) => newsData.remove(item);
  void removeAtIndexFromNewsData(int index) => newsData.removeAt(index);
  void insertAtIndexInNewsData(int index, CryptonewsStruct item) =>
      newsData.insert(index, item);
  void updateNewsDataAtIndex(int index, Function(CryptonewsStruct) updateFn) =>
      newsData[index] = updateFn(newsData[index]);

  bool? loadingNews = true;

  bool? loadingTrending;

  List<CoinDataStruct> trendingCoin = [];
  void addToTrendingCoin(CoinDataStruct item) => trendingCoin.add(item);
  void removeFromTrendingCoin(CoinDataStruct item) => trendingCoin.remove(item);
  void removeAtIndexFromTrendingCoin(int index) => trendingCoin.removeAt(index);
  void insertAtIndexInTrendingCoin(int index, CoinDataStruct item) =>
      trendingCoin.insert(index, item);
  void updateTrendingCoinAtIndex(
          int index, Function(CoinDataStruct) updateFn) =>
      trendingCoin[index] = updateFn(trendingCoin[index]);

  List<CoinDataStruct> mostVisitedCoin = [];
  void addToMostVisitedCoin(CoinDataStruct item) => mostVisitedCoin.add(item);
  void removeFromMostVisitedCoin(CoinDataStruct item) =>
      mostVisitedCoin.remove(item);
  void removeAtIndexFromMostVisitedCoin(int index) =>
      mostVisitedCoin.removeAt(index);
  void insertAtIndexInMostVisitedCoin(int index, CoinDataStruct item) =>
      mostVisitedCoin.insert(index, item);
  void updateMostVisitedCoinAtIndex(
          int index, Function(CoinDataStruct) updateFn) =>
      mostVisitedCoin[index] = updateFn(mostVisitedCoin[index]);

  List<CoinDataStruct> newCoin = [];
  void addToNewCoin(CoinDataStruct item) => newCoin.add(item);
  void removeFromNewCoin(CoinDataStruct item) => newCoin.remove(item);
  void removeAtIndexFromNewCoin(int index) => newCoin.removeAt(index);
  void insertAtIndexInNewCoin(int index, CoinDataStruct item) =>
      newCoin.insert(index, item);
  void updateNewCoinAtIndex(int index, Function(CoinDataStruct) updateFn) =>
      newCoin[index] = updateFn(newCoin[index]);

  List<String> dateList = [];
  void addToDateList(String item) => dateList.add(item);
  void removeFromDateList(String item) => dateList.remove(item);
  void removeAtIndexFromDateList(int index) => dateList.removeAt(index);
  void insertAtIndexInDateList(int index, String item) =>
      dateList.insert(index, item);
  void updateDateListAtIndex(int index, Function(String) updateFn) =>
      dateList[index] = updateFn(dateList[index]);

  int curPage = 1;

  BurnArchiveParentStruct? googleSheets;
  void updateGoogleSheetsStruct(Function(BurnArchiveParentStruct) updateFn) {
    updateFn(googleSheets ??= BurnArchiveParentStruct());
  }

  String nameSelectedCoinNavBar = 'Price';

  List<CoinDataStruct> burnedCoins = [];
  void addToBurnedCoins(CoinDataStruct item) => burnedCoins.add(item);
  void removeFromBurnedCoins(CoinDataStruct item) => burnedCoins.remove(item);
  void removeAtIndexFromBurnedCoins(int index) => burnedCoins.removeAt(index);
  void insertAtIndexInBurnedCoins(int index, CoinDataStruct item) =>
      burnedCoins.insert(index, item);
  void updateBurnedCoinsAtIndex(int index, Function(CoinDataStruct) updateFn) =>
      burnedCoins[index] = updateFn(burnedCoins[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Price)] action in Home widget.
  ApiCallResponse? apiResultCoin;
  // Stores action output result for [Backend Call - API (NewsLatest)] action in Home widget.
  ApiCallResponse? newsApiResult;
  // Stores action output result for [Backend Call - API (TrendingCoin)] action in Home widget.
  ApiCallResponse? apiResultTrendingCoin;
  // Stores action output result for [Backend Call - API (MostVisitedCoin)] action in Home widget.
  ApiCallResponse? apiResultMostVisitedCoin;
  // Stores action output result for [Backend Call - API (RecentlyAddedCoin)] action in Home widget.
  ApiCallResponse? apiResultNewCoin;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for Carousel widget.
  CarouselController? carouselController1;
  int carouselCurrentIndex1 = 1;

  // State field(s) for Carousel widget.
  CarouselController? carouselController2;
  int carouselCurrentIndex2 = 1;

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for Footer component.
  late FooterModel footerModel;
  // Model for AppBar_Mobile component.
  late AppBarMobileModel appBarMobileModel;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for Carousel widget.
  CarouselController? carouselController3;
  int carouselCurrentIndex3 = 1;

  // State field(s) for Carousel widget.
  CarouselController? carouselController4;
  int carouselCurrentIndex4 = 1;

  // State field(s) for Carousel widget.
  CarouselController? carouselController5;
  int carouselCurrentIndex5 = 1;

  // Model for Navbar_Mobile component.
  late NavbarMobileModel navbarMobileModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
    footerModel = createModel(context, () => FooterModel());
    appBarMobileModel = createModel(context, () => AppBarMobileModel());
    navbarMobileModel = createModel(context, () => NavbarMobileModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
    footerModel.dispose();
    appBarMobileModel.dispose();
    navbarMobileModel.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
