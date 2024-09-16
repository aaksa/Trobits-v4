// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class BurnArchiveStruct extends FFFirebaseStruct {
  BurnArchiveStruct({
    String? date,
    String? coins,
    String? hash,
    double? projectedBurn,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _date = date,
        _coins = coins,
        _hash = hash,
        _projectedBurn = projectedBurn,
        super(firestoreUtilData);

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  // "coins" field.
  String? _coins;
  String get coins => _coins ?? '';
  set coins(String? val) => _coins = val;

  bool hasCoins() => _coins != null;

  // "hash" field.
  String? _hash;
  String get hash => _hash ?? '';
  set hash(String? val) => _hash = val;

  bool hasHash() => _hash != null;

  // "projected_burn" field.
  double? _projectedBurn;
  double get projectedBurn => _projectedBurn ?? 0.0;
  set projectedBurn(double? val) => _projectedBurn = val;

  void incrementProjectedBurn(double amount) =>
      projectedBurn = projectedBurn + amount;

  bool hasProjectedBurn() => _projectedBurn != null;

  static BurnArchiveStruct fromMap(Map<String, dynamic> data) =>
      BurnArchiveStruct(
        date: data['date'] as String?,
        coins: data['coins'] as String?,
        hash: data['hash'] as String?,
        projectedBurn: castToType<double>(data['projected_burn']),
      );

  static BurnArchiveStruct? maybeFromMap(dynamic data) => data is Map
      ? BurnArchiveStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'coins': _coins,
        'hash': _hash,
        'projected_burn': _projectedBurn,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'coins': serializeParam(
          _coins,
          ParamType.String,
        ),
        'hash': serializeParam(
          _hash,
          ParamType.String,
        ),
        'projected_burn': serializeParam(
          _projectedBurn,
          ParamType.double,
        ),
      }.withoutNulls;

  static BurnArchiveStruct fromSerializableMap(Map<String, dynamic> data) =>
      BurnArchiveStruct(
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        coins: deserializeParam(
          data['coins'],
          ParamType.String,
          false,
        ),
        hash: deserializeParam(
          data['hash'],
          ParamType.String,
          false,
        ),
        projectedBurn: deserializeParam(
          data['projected_burn'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'BurnArchiveStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BurnArchiveStruct &&
        date == other.date &&
        coins == other.coins &&
        hash == other.hash &&
        projectedBurn == other.projectedBurn;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([date, coins, hash, projectedBurn]);
}

BurnArchiveStruct createBurnArchiveStruct({
  String? date,
  String? coins,
  String? hash,
  double? projectedBurn,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BurnArchiveStruct(
      date: date,
      coins: coins,
      hash: hash,
      projectedBurn: projectedBurn,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BurnArchiveStruct? updateBurnArchiveStruct(
  BurnArchiveStruct? burnArchive, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    burnArchive
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBurnArchiveStructData(
  Map<String, dynamic> firestoreData,
  BurnArchiveStruct? burnArchive,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (burnArchive == null) {
    return;
  }
  if (burnArchive.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && burnArchive.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final burnArchiveData =
      getBurnArchiveFirestoreData(burnArchive, forFieldValue);
  final nestedData =
      burnArchiveData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = burnArchive.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBurnArchiveFirestoreData(
  BurnArchiveStruct? burnArchive, [
  bool forFieldValue = false,
]) {
  if (burnArchive == null) {
    return {};
  }
  final firestoreData = mapToFirestore(burnArchive.toMap());

  // Add any Firestore field values
  burnArchive.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBurnArchiveListFirestoreData(
  List<BurnArchiveStruct>? burnArchives,
) =>
    burnArchives?.map((e) => getBurnArchiveFirestoreData(e, true)).toList() ??
    [];
