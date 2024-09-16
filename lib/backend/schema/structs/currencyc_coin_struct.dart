// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CurrencycCoinStruct extends FFFirebaseStruct {
  CurrencycCoinStruct({
    double? price,
    double? marketCap,
    double? percentChange24h,
    double? percentChange7d,
    double? percentChange30d,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _price = price,
        _marketCap = marketCap,
        _percentChange24h = percentChange24h,
        _percentChange7d = percentChange7d,
        _percentChange30d = percentChange30d,
        super(firestoreUtilData);

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "market_cap" field.
  double? _marketCap;
  double get marketCap => _marketCap ?? 0.0;
  set marketCap(double? val) => _marketCap = val;

  void incrementMarketCap(double amount) => marketCap = marketCap + amount;

  bool hasMarketCap() => _marketCap != null;

  // "percent_change_24h" field.
  double? _percentChange24h;
  double get percentChange24h => _percentChange24h ?? 0.0;
  set percentChange24h(double? val) => _percentChange24h = val;

  void incrementPercentChange24h(double amount) =>
      percentChange24h = percentChange24h + amount;

  bool hasPercentChange24h() => _percentChange24h != null;

  // "percent_change_7d" field.
  double? _percentChange7d;
  double get percentChange7d => _percentChange7d ?? 0.0;
  set percentChange7d(double? val) => _percentChange7d = val;

  void incrementPercentChange7d(double amount) =>
      percentChange7d = percentChange7d + amount;

  bool hasPercentChange7d() => _percentChange7d != null;

  // "percent_change_30d" field.
  double? _percentChange30d;
  double get percentChange30d => _percentChange30d ?? 0.0;
  set percentChange30d(double? val) => _percentChange30d = val;

  void incrementPercentChange30d(double amount) =>
      percentChange30d = percentChange30d + amount;

  bool hasPercentChange30d() => _percentChange30d != null;

  static CurrencycCoinStruct fromMap(Map<String, dynamic> data) =>
      CurrencycCoinStruct(
        price: castToType<double>(data['price']),
        marketCap: castToType<double>(data['market_cap']),
        percentChange24h: castToType<double>(data['percent_change_24h']),
        percentChange7d: castToType<double>(data['percent_change_7d']),
        percentChange30d: castToType<double>(data['percent_change_30d']),
      );

  static CurrencycCoinStruct? maybeFromMap(dynamic data) => data is Map
      ? CurrencycCoinStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'price': _price,
        'market_cap': _marketCap,
        'percent_change_24h': _percentChange24h,
        'percent_change_7d': _percentChange7d,
        'percent_change_30d': _percentChange30d,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'market_cap': serializeParam(
          _marketCap,
          ParamType.double,
        ),
        'percent_change_24h': serializeParam(
          _percentChange24h,
          ParamType.double,
        ),
        'percent_change_7d': serializeParam(
          _percentChange7d,
          ParamType.double,
        ),
        'percent_change_30d': serializeParam(
          _percentChange30d,
          ParamType.double,
        ),
      }.withoutNulls;

  static CurrencycCoinStruct fromSerializableMap(Map<String, dynamic> data) =>
      CurrencycCoinStruct(
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        marketCap: deserializeParam(
          data['market_cap'],
          ParamType.double,
          false,
        ),
        percentChange24h: deserializeParam(
          data['percent_change_24h'],
          ParamType.double,
          false,
        ),
        percentChange7d: deserializeParam(
          data['percent_change_7d'],
          ParamType.double,
          false,
        ),
        percentChange30d: deserializeParam(
          data['percent_change_30d'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'CurrencycCoinStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CurrencycCoinStruct &&
        price == other.price &&
        marketCap == other.marketCap &&
        percentChange24h == other.percentChange24h &&
        percentChange7d == other.percentChange7d &&
        percentChange30d == other.percentChange30d;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [price, marketCap, percentChange24h, percentChange7d, percentChange30d]);
}

CurrencycCoinStruct createCurrencycCoinStruct({
  double? price,
  double? marketCap,
  double? percentChange24h,
  double? percentChange7d,
  double? percentChange30d,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CurrencycCoinStruct(
      price: price,
      marketCap: marketCap,
      percentChange24h: percentChange24h,
      percentChange7d: percentChange7d,
      percentChange30d: percentChange30d,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CurrencycCoinStruct? updateCurrencycCoinStruct(
  CurrencycCoinStruct? currencycCoin, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    currencycCoin
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCurrencycCoinStructData(
  Map<String, dynamic> firestoreData,
  CurrencycCoinStruct? currencycCoin,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (currencycCoin == null) {
    return;
  }
  if (currencycCoin.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && currencycCoin.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final currencycCoinData =
      getCurrencycCoinFirestoreData(currencycCoin, forFieldValue);
  final nestedData =
      currencycCoinData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = currencycCoin.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCurrencycCoinFirestoreData(
  CurrencycCoinStruct? currencycCoin, [
  bool forFieldValue = false,
]) {
  if (currencycCoin == null) {
    return {};
  }
  final firestoreData = mapToFirestore(currencycCoin.toMap());

  // Add any Firestore field values
  currencycCoin.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCurrencycCoinListFirestoreData(
  List<CurrencycCoinStruct>? currencycCoins,
) =>
    currencycCoins
        ?.map((e) => getCurrencycCoinFirestoreData(e, true))
        .toList() ??
    [];
