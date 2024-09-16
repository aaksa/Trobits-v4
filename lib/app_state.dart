import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _SelectedCoinView =
          prefs.getInt('ff_SelectedCoinView') ?? _SelectedCoinView;
    });
    _safeInit(() {
      _TrendingCoin = prefs
              .getStringList('ff_TrendingCoin')
              ?.map((x) {
                try {
                  return CoinDataStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _TrendingCoin;
    });
    _safeInit(() {
      _MostVisitedCoin = prefs
              .getStringList('ff_MostVisitedCoin')
              ?.map((x) {
                try {
                  return CoinDataStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _MostVisitedCoin;
    });
    _safeInit(() {
      _PriceCoin = prefs
              .getStringList('ff_PriceCoin')
              ?.map((x) {
                try {
                  return CoinDataStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _PriceCoin;
    });
    _safeInit(() {
      _RecentlyAddedCoin = prefs
              .getStringList('ff_RecentlyAddedCoin')
              ?.map((x) {
                try {
                  return CoinDataStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _RecentlyAddedCoin;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _indexNav = 0;
  int get indexNav => _indexNav;
  set indexNav(int value) {
    _indexNav = value;
  }

  int _SelectedCoinView = 0;
  int get SelectedCoinView => _SelectedCoinView;
  set SelectedCoinView(int value) {
    _SelectedCoinView = value;
    prefs.setInt('ff_SelectedCoinView', value);
  }

  String _currentPageName = 'Home';
  String get currentPageName => _currentPageName;
  set currentPageName(String value) {
    _currentPageName = value;
  }

  List<CoinDataStruct> _TrendingCoin = [];
  List<CoinDataStruct> get TrendingCoin => _TrendingCoin;
  set TrendingCoin(List<CoinDataStruct> value) {
    _TrendingCoin = value;
    prefs.setStringList(
        'ff_TrendingCoin', value.map((x) => x.serialize()).toList());
  }

  void addToTrendingCoin(CoinDataStruct value) {
    TrendingCoin.add(value);
    prefs.setStringList(
        'ff_TrendingCoin', _TrendingCoin.map((x) => x.serialize()).toList());
  }

  void removeFromTrendingCoin(CoinDataStruct value) {
    TrendingCoin.remove(value);
    prefs.setStringList(
        'ff_TrendingCoin', _TrendingCoin.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTrendingCoin(int index) {
    TrendingCoin.removeAt(index);
    prefs.setStringList(
        'ff_TrendingCoin', _TrendingCoin.map((x) => x.serialize()).toList());
  }

  void updateTrendingCoinAtIndex(
    int index,
    CoinDataStruct Function(CoinDataStruct) updateFn,
  ) {
    TrendingCoin[index] = updateFn(_TrendingCoin[index]);
    prefs.setStringList(
        'ff_TrendingCoin', _TrendingCoin.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTrendingCoin(int index, CoinDataStruct value) {
    TrendingCoin.insert(index, value);
    prefs.setStringList(
        'ff_TrendingCoin', _TrendingCoin.map((x) => x.serialize()).toList());
  }

  List<CoinDataStruct> _MostVisitedCoin = [];
  List<CoinDataStruct> get MostVisitedCoin => _MostVisitedCoin;
  set MostVisitedCoin(List<CoinDataStruct> value) {
    _MostVisitedCoin = value;
    prefs.setStringList(
        'ff_MostVisitedCoin', value.map((x) => x.serialize()).toList());
  }

  void addToMostVisitedCoin(CoinDataStruct value) {
    MostVisitedCoin.add(value);
    prefs.setStringList('ff_MostVisitedCoin',
        _MostVisitedCoin.map((x) => x.serialize()).toList());
  }

  void removeFromMostVisitedCoin(CoinDataStruct value) {
    MostVisitedCoin.remove(value);
    prefs.setStringList('ff_MostVisitedCoin',
        _MostVisitedCoin.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromMostVisitedCoin(int index) {
    MostVisitedCoin.removeAt(index);
    prefs.setStringList('ff_MostVisitedCoin',
        _MostVisitedCoin.map((x) => x.serialize()).toList());
  }

  void updateMostVisitedCoinAtIndex(
    int index,
    CoinDataStruct Function(CoinDataStruct) updateFn,
  ) {
    MostVisitedCoin[index] = updateFn(_MostVisitedCoin[index]);
    prefs.setStringList('ff_MostVisitedCoin',
        _MostVisitedCoin.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInMostVisitedCoin(int index, CoinDataStruct value) {
    MostVisitedCoin.insert(index, value);
    prefs.setStringList('ff_MostVisitedCoin',
        _MostVisitedCoin.map((x) => x.serialize()).toList());
  }

  List<CoinDataStruct> _PriceCoin = [];
  List<CoinDataStruct> get PriceCoin => _PriceCoin;
  set PriceCoin(List<CoinDataStruct> value) {
    _PriceCoin = value;
    prefs.setStringList(
        'ff_PriceCoin', value.map((x) => x.serialize()).toList());
  }

  void addToPriceCoin(CoinDataStruct value) {
    PriceCoin.add(value);
    prefs.setStringList(
        'ff_PriceCoin', _PriceCoin.map((x) => x.serialize()).toList());
  }

  void removeFromPriceCoin(CoinDataStruct value) {
    PriceCoin.remove(value);
    prefs.setStringList(
        'ff_PriceCoin', _PriceCoin.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromPriceCoin(int index) {
    PriceCoin.removeAt(index);
    prefs.setStringList(
        'ff_PriceCoin', _PriceCoin.map((x) => x.serialize()).toList());
  }

  void updatePriceCoinAtIndex(
    int index,
    CoinDataStruct Function(CoinDataStruct) updateFn,
  ) {
    PriceCoin[index] = updateFn(_PriceCoin[index]);
    prefs.setStringList(
        'ff_PriceCoin', _PriceCoin.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInPriceCoin(int index, CoinDataStruct value) {
    PriceCoin.insert(index, value);
    prefs.setStringList(
        'ff_PriceCoin', _PriceCoin.map((x) => x.serialize()).toList());
  }

  List<CoinDataStruct> _RecentlyAddedCoin = [];
  List<CoinDataStruct> get RecentlyAddedCoin => _RecentlyAddedCoin;
  set RecentlyAddedCoin(List<CoinDataStruct> value) {
    _RecentlyAddedCoin = value;
    prefs.setStringList(
        'ff_RecentlyAddedCoin', value.map((x) => x.serialize()).toList());
  }

  void addToRecentlyAddedCoin(CoinDataStruct value) {
    RecentlyAddedCoin.add(value);
    prefs.setStringList('ff_RecentlyAddedCoin',
        _RecentlyAddedCoin.map((x) => x.serialize()).toList());
  }

  void removeFromRecentlyAddedCoin(CoinDataStruct value) {
    RecentlyAddedCoin.remove(value);
    prefs.setStringList('ff_RecentlyAddedCoin',
        _RecentlyAddedCoin.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromRecentlyAddedCoin(int index) {
    RecentlyAddedCoin.removeAt(index);
    prefs.setStringList('ff_RecentlyAddedCoin',
        _RecentlyAddedCoin.map((x) => x.serialize()).toList());
  }

  void updateRecentlyAddedCoinAtIndex(
    int index,
    CoinDataStruct Function(CoinDataStruct) updateFn,
  ) {
    RecentlyAddedCoin[index] = updateFn(_RecentlyAddedCoin[index]);
    prefs.setStringList('ff_RecentlyAddedCoin',
        _RecentlyAddedCoin.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInRecentlyAddedCoin(int index, CoinDataStruct value) {
    RecentlyAddedCoin.insert(index, value);
    prefs.setStringList('ff_RecentlyAddedCoin',
        _RecentlyAddedCoin.map((x) => x.serialize()).toList());
  }

  List<BurnedCoinsStruct> _burnedLunc = [
    BurnedCoinsStruct.fromSerializableMap(jsonDecode(
        '{\"visits\":\"0\",\"revenue\":\"0\",\"burns\":\"0\",\"interval\":\"24 Hours\",\"daily_projected\":\"0\"}')),
    BurnedCoinsStruct.fromSerializableMap(jsonDecode(
        '{\"visits\":\"0\",\"revenue\":\"0\",\"burns\":\"0\",\"interval\":\"7 Days\",\"daily_projected\":\"0\"}')),
    BurnedCoinsStruct.fromSerializableMap(jsonDecode(
        '{\"visits\":\"0\",\"revenue\":\"0\",\"burns\":\"0\",\"interval\":\"1 Month\",\"daily_projected\":\"0\"}'))
  ];
  List<BurnedCoinsStruct> get burnedLunc => _burnedLunc;
  set burnedLunc(List<BurnedCoinsStruct> value) {
    _burnedLunc = value;
  }

  void addToBurnedLunc(BurnedCoinsStruct value) {
    burnedLunc.add(value);
  }

  void removeFromBurnedLunc(BurnedCoinsStruct value) {
    burnedLunc.remove(value);
  }

  void removeAtIndexFromBurnedLunc(int index) {
    burnedLunc.removeAt(index);
  }

  void updateBurnedLuncAtIndex(
    int index,
    BurnedCoinsStruct Function(BurnedCoinsStruct) updateFn,
  ) {
    burnedLunc[index] = updateFn(_burnedLunc[index]);
  }

  void insertAtIndexInBurnedLunc(int index, BurnedCoinsStruct value) {
    burnedLunc.insert(index, value);
  }

  List<BurnedCoinsStruct> _burnedShiba = [
    BurnedCoinsStruct.fromSerializableMap(jsonDecode(
        '{\"visits\":\"0\",\"revenue\":\"0\",\"burns\":\"0\",\"interval\":\"24 Hours\",\"daily_projected\":\"0\"}')),
    BurnedCoinsStruct.fromSerializableMap(jsonDecode(
        '{\"visits\":\"0\",\"revenue\":\"0\",\"burns\":\"0\",\"interval\":\"7 Days\",\"daily_projected\":\"0\"}')),
    BurnedCoinsStruct.fromSerializableMap(jsonDecode(
        '{\"visits\":\"0\",\"revenue\":\"0\",\"burns\":\"0\",\"interval\":\"1 Month\",\"daily_projected\":\"0\"}'))
  ];
  List<BurnedCoinsStruct> get burnedShiba => _burnedShiba;
  set burnedShiba(List<BurnedCoinsStruct> value) {
    _burnedShiba = value;
  }

  void addToBurnedShiba(BurnedCoinsStruct value) {
    burnedShiba.add(value);
  }

  void removeFromBurnedShiba(BurnedCoinsStruct value) {
    burnedShiba.remove(value);
  }

  void removeAtIndexFromBurnedShiba(int index) {
    burnedShiba.removeAt(index);
  }

  void updateBurnedShibaAtIndex(
    int index,
    BurnedCoinsStruct Function(BurnedCoinsStruct) updateFn,
  ) {
    burnedShiba[index] = updateFn(_burnedShiba[index]);
  }

  void insertAtIndexInBurnedShiba(int index, BurnedCoinsStruct value) {
    burnedShiba.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
