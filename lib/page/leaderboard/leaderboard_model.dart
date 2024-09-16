import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/footer/footer_widget.dart';
import '/components/mobile/app_bar_mobile/app_bar_mobile_widget.dart';
import '/components/mobile/navbar_mobile/navbar_mobile_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'leaderboard_widget.dart' show LeaderboardWidget;
import 'package:flutter/material.dart';

class LeaderboardModel extends FlutterFlowModel<LeaderboardWidget> {
  ///  Local state fields for this page.

  int? index = 0;

  List<CoinDataStruct> trending = [];
  void addToTrending(CoinDataStruct item) => trending.add(item);
  void removeFromTrending(CoinDataStruct item) => trending.remove(item);
  void removeAtIndexFromTrending(int index) => trending.removeAt(index);
  void insertAtIndexInTrending(int index, CoinDataStruct item) =>
      trending.insert(index, item);
  void updateTrendingAtIndex(int index, Function(CoinDataStruct) updateFn) =>
      trending[index] = updateFn(trending[index]);

  List<CoinDataStruct> mostVisited = [];
  void addToMostVisited(CoinDataStruct item) => mostVisited.add(item);
  void removeFromMostVisited(CoinDataStruct item) => mostVisited.remove(item);
  void removeAtIndexFromMostVisited(int index) => mostVisited.removeAt(index);
  void insertAtIndexInMostVisited(int index, CoinDataStruct item) =>
      mostVisited.insert(index, item);
  void updateMostVisitedAtIndex(int index, Function(CoinDataStruct) updateFn) =>
      mostVisited[index] = updateFn(mostVisited[index]);

  List<CoinDataStruct> recentlyAdded = [];
  void addToRecentlyAdded(CoinDataStruct item) => recentlyAdded.add(item);
  void removeFromRecentlyAdded(CoinDataStruct item) =>
      recentlyAdded.remove(item);
  void removeAtIndexFromRecentlyAdded(int index) =>
      recentlyAdded.removeAt(index);
  void insertAtIndexInRecentlyAdded(int index, CoinDataStruct item) =>
      recentlyAdded.insert(index, item);
  void updateRecentlyAddedAtIndex(
          int index, Function(CoinDataStruct) updateFn) =>
      recentlyAdded[index] = updateFn(recentlyAdded[index]);

  List<String> categoryButton = [
    'Coins',
    'Trending',
    'Most Visited',
    'Recently Added'
  ];
  void addToCategoryButton(String item) => categoryButton.add(item);
  void removeFromCategoryButton(String item) => categoryButton.remove(item);
  void removeAtIndexFromCategoryButton(int index) =>
      categoryButton.removeAt(index);
  void insertAtIndexInCategoryButton(int index, String item) =>
      categoryButton.insert(index, item);
  void updateCategoryButtonAtIndex(int index, Function(String) updateFn) =>
      categoryButton[index] = updateFn(categoryButton[index]);

  bool? isloading = true;

  List<int> xlist = [1, 7];
  void addToXlist(int item) => xlist.add(item);
  void removeFromXlist(int item) => xlist.remove(item);
  void removeAtIndexFromXlist(int index) => xlist.removeAt(index);
  void insertAtIndexInXlist(int index, int item) => xlist.insert(index, item);
  void updateXlistAtIndex(int index, Function(int) updateFn) =>
      xlist[index] = updateFn(xlist[index]);

  List<double> ylist = [];
  void addToYlist(double item) => ylist.add(item);
  void removeFromYlist(double item) => ylist.remove(item);
  void removeAtIndexFromYlist(int index) => ylist.removeAt(index);
  void insertAtIndexInYlist(int index, double item) =>
      ylist.insert(index, item);
  void updateYlistAtIndex(int index, Function(double) updateFn) =>
      ylist[index] = updateFn(ylist[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (TrendingCoin)] action in Leaderboard widget.
  ApiCallResponse? trendingCoin;
  // Stores action output result for [Backend Call - API (MostVisitedCoin)] action in Leaderboard widget.
  ApiCallResponse? mostVisitedCoin;
  // Stores action output result for [Backend Call - API (RecentlyAddedCoin)] action in Leaderboard widget.
  ApiCallResponse? recentlyAddedCoin;
  // Stores action output result for [Backend Call - API (Price)] action in Leaderboard widget.
  ApiCallResponse? apiResultCoin;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController1 =
      FlutterFlowDataTableController<CoinDataStruct>();
  // Model for Footer component.
  late FooterModel footerModel;
  // Model for AppBar_Mobile component.
  late AppBarMobileModel appBarMobileModel;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController2 =
      FlutterFlowDataTableController<CoinDataStruct>();
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
    paginatedDataTableController1.dispose();
    footerModel.dispose();
    appBarMobileModel.dispose();
    paginatedDataTableController2.dispose();
    navbarMobileModel.dispose();
  }
}
