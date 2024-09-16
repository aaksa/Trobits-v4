// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TrobitsStruct extends FFFirebaseStruct {
  TrobitsStruct({
    String? burns,
    String? revenue,
    String? date,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _burns = burns,
        _revenue = revenue,
        _date = date,
        super(firestoreUtilData);

  // "Burns" field.
  String? _burns;
  String get burns => _burns ?? '';
  set burns(String? val) => _burns = val;

  bool hasBurns() => _burns != null;

  // "Revenue" field.
  String? _revenue;
  String get revenue => _revenue ?? '';
  set revenue(String? val) => _revenue = val;

  bool hasRevenue() => _revenue != null;

  // "Date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  static TrobitsStruct fromMap(Map<String, dynamic> data) => TrobitsStruct(
        burns: data['Burns'] as String?,
        revenue: data['Revenue'] as String?,
        date: data['Date'] as String?,
      );

  static TrobitsStruct? maybeFromMap(dynamic data) =>
      data is Map ? TrobitsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Burns': _burns,
        'Revenue': _revenue,
        'Date': _date,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Burns': serializeParam(
          _burns,
          ParamType.String,
        ),
        'Revenue': serializeParam(
          _revenue,
          ParamType.String,
        ),
        'Date': serializeParam(
          _date,
          ParamType.String,
        ),
      }.withoutNulls;

  static TrobitsStruct fromSerializableMap(Map<String, dynamic> data) =>
      TrobitsStruct(
        burns: deserializeParam(
          data['Burns'],
          ParamType.String,
          false,
        ),
        revenue: deserializeParam(
          data['Revenue'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['Date'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TrobitsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TrobitsStruct &&
        burns == other.burns &&
        revenue == other.revenue &&
        date == other.date;
  }

  @override
  int get hashCode => const ListEquality().hash([burns, revenue, date]);
}

TrobitsStruct createTrobitsStruct({
  String? burns,
  String? revenue,
  String? date,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TrobitsStruct(
      burns: burns,
      revenue: revenue,
      date: date,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TrobitsStruct? updateTrobitsStruct(
  TrobitsStruct? trobits, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    trobits
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTrobitsStructData(
  Map<String, dynamic> firestoreData,
  TrobitsStruct? trobits,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (trobits == null) {
    return;
  }
  if (trobits.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && trobits.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final trobitsData = getTrobitsFirestoreData(trobits, forFieldValue);
  final nestedData = trobitsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = trobits.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTrobitsFirestoreData(
  TrobitsStruct? trobits, [
  bool forFieldValue = false,
]) {
  if (trobits == null) {
    return {};
  }
  final firestoreData = mapToFirestore(trobits.toMap());

  // Add any Firestore field values
  trobits.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTrobitsListFirestoreData(
  List<TrobitsStruct>? trobitss,
) =>
    trobitss?.map((e) => getTrobitsFirestoreData(e, true)).toList() ?? [];
