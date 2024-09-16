// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class BurnedCoinsStruct extends FFFirebaseStruct {
  BurnedCoinsStruct({
    int? visits,
    int? revenue,
    int? burns,
    String? interval,
    double? dailyProjected,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _visits = visits,
        _revenue = revenue,
        _burns = burns,
        _interval = interval,
        _dailyProjected = dailyProjected,
        super(firestoreUtilData);

  // "visits" field.
  int? _visits;
  int get visits => _visits ?? 0;
  set visits(int? val) => _visits = val;

  void incrementVisits(int amount) => visits = visits + amount;

  bool hasVisits() => _visits != null;

  // "revenue" field.
  int? _revenue;
  int get revenue => _revenue ?? 0;
  set revenue(int? val) => _revenue = val;

  void incrementRevenue(int amount) => revenue = revenue + amount;

  bool hasRevenue() => _revenue != null;

  // "burns" field.
  int? _burns;
  int get burns => _burns ?? 0;
  set burns(int? val) => _burns = val;

  void incrementBurns(int amount) => burns = burns + amount;

  bool hasBurns() => _burns != null;

  // "interval" field.
  String? _interval;
  String get interval => _interval ?? '';
  set interval(String? val) => _interval = val;

  bool hasInterval() => _interval != null;

  // "daily_projected" field.
  double? _dailyProjected;
  double get dailyProjected => _dailyProjected ?? 0.0;
  set dailyProjected(double? val) => _dailyProjected = val;

  void incrementDailyProjected(double amount) =>
      dailyProjected = dailyProjected + amount;

  bool hasDailyProjected() => _dailyProjected != null;

  static BurnedCoinsStruct fromMap(Map<String, dynamic> data) =>
      BurnedCoinsStruct(
        visits: castToType<int>(data['visits']),
        revenue: castToType<int>(data['revenue']),
        burns: castToType<int>(data['burns']),
        interval: data['interval'] as String?,
        dailyProjected: castToType<double>(data['daily_projected']),
      );

  static BurnedCoinsStruct? maybeFromMap(dynamic data) => data is Map
      ? BurnedCoinsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'visits': _visits,
        'revenue': _revenue,
        'burns': _burns,
        'interval': _interval,
        'daily_projected': _dailyProjected,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'visits': serializeParam(
          _visits,
          ParamType.int,
        ),
        'revenue': serializeParam(
          _revenue,
          ParamType.int,
        ),
        'burns': serializeParam(
          _burns,
          ParamType.int,
        ),
        'interval': serializeParam(
          _interval,
          ParamType.String,
        ),
        'daily_projected': serializeParam(
          _dailyProjected,
          ParamType.double,
        ),
      }.withoutNulls;

  static BurnedCoinsStruct fromSerializableMap(Map<String, dynamic> data) =>
      BurnedCoinsStruct(
        visits: deserializeParam(
          data['visits'],
          ParamType.int,
          false,
        ),
        revenue: deserializeParam(
          data['revenue'],
          ParamType.int,
          false,
        ),
        burns: deserializeParam(
          data['burns'],
          ParamType.int,
          false,
        ),
        interval: deserializeParam(
          data['interval'],
          ParamType.String,
          false,
        ),
        dailyProjected: deserializeParam(
          data['daily_projected'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'BurnedCoinsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BurnedCoinsStruct &&
        visits == other.visits &&
        revenue == other.revenue &&
        burns == other.burns &&
        interval == other.interval &&
        dailyProjected == other.dailyProjected;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([visits, revenue, burns, interval, dailyProjected]);
}

BurnedCoinsStruct createBurnedCoinsStruct({
  int? visits,
  int? revenue,
  int? burns,
  String? interval,
  double? dailyProjected,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BurnedCoinsStruct(
      visits: visits,
      revenue: revenue,
      burns: burns,
      interval: interval,
      dailyProjected: dailyProjected,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BurnedCoinsStruct? updateBurnedCoinsStruct(
  BurnedCoinsStruct? burnedCoins, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    burnedCoins
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBurnedCoinsStructData(
  Map<String, dynamic> firestoreData,
  BurnedCoinsStruct? burnedCoins,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (burnedCoins == null) {
    return;
  }
  if (burnedCoins.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && burnedCoins.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final burnedCoinsData =
      getBurnedCoinsFirestoreData(burnedCoins, forFieldValue);
  final nestedData =
      burnedCoinsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = burnedCoins.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBurnedCoinsFirestoreData(
  BurnedCoinsStruct? burnedCoins, [
  bool forFieldValue = false,
]) {
  if (burnedCoins == null) {
    return {};
  }
  final firestoreData = mapToFirestore(burnedCoins.toMap());

  // Add any Firestore field values
  burnedCoins.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBurnedCoinsListFirestoreData(
  List<BurnedCoinsStruct>? burnedCoinss,
) =>
    burnedCoinss?.map((e) => getBurnedCoinsFirestoreData(e, true)).toList() ??
    [];
