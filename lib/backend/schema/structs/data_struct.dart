// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataStruct extends FFFirebaseStruct {
  DataStruct({
    double? circulatingSupply,
    String? name,
    CurrencyStruct? quote,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _circulatingSupply = circulatingSupply,
        _name = name,
        _quote = quote,
        super(firestoreUtilData);

  // "circulating_supply" field.
  double? _circulatingSupply;
  double get circulatingSupply => _circulatingSupply ?? 0.0;
  set circulatingSupply(double? val) => _circulatingSupply = val;

  void incrementCirculatingSupply(double amount) =>
      circulatingSupply = circulatingSupply + amount;

  bool hasCirculatingSupply() => _circulatingSupply != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "quote" field.
  CurrencyStruct? _quote;
  CurrencyStruct get quote => _quote ?? CurrencyStruct();
  set quote(CurrencyStruct? val) => _quote = val;

  void updateQuote(Function(CurrencyStruct) updateFn) {
    updateFn(_quote ??= CurrencyStruct());
  }

  bool hasQuote() => _quote != null;

  static DataStruct fromMap(Map<String, dynamic> data) => DataStruct(
        circulatingSupply: castToType<double>(data['circulating_supply']),
        name: data['name'] as String?,
        quote: CurrencyStruct.maybeFromMap(data['quote']),
      );

  static DataStruct? maybeFromMap(dynamic data) =>
      data is Map ? DataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'circulating_supply': _circulatingSupply,
        'name': _name,
        'quote': _quote?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'circulating_supply': serializeParam(
          _circulatingSupply,
          ParamType.double,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'quote': serializeParam(
          _quote,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static DataStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataStruct(
        circulatingSupply: deserializeParam(
          data['circulating_supply'],
          ParamType.double,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        quote: deserializeStructParam(
          data['quote'],
          ParamType.DataStruct,
          false,
          structBuilder: CurrencyStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataStruct &&
        circulatingSupply == other.circulatingSupply &&
        name == other.name &&
        quote == other.quote;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([circulatingSupply, name, quote]);
}

DataStruct createDataStruct({
  double? circulatingSupply,
  String? name,
  CurrencyStruct? quote,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DataStruct(
      circulatingSupply: circulatingSupply,
      name: name,
      quote: quote ?? (clearUnsetFields ? CurrencyStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DataStruct? updateDataStruct(
  DataStruct? data, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    data
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDataStructData(
  Map<String, dynamic> firestoreData,
  DataStruct? data,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (data == null) {
    return;
  }
  if (data.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && data.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dataData = getDataFirestoreData(data, forFieldValue);
  final nestedData = dataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = data.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDataFirestoreData(
  DataStruct? data, [
  bool forFieldValue = false,
]) {
  if (data == null) {
    return {};
  }
  final firestoreData = mapToFirestore(data.toMap());

  // Handle nested data for "quote" field.
  addCurrencyStructData(
    firestoreData,
    data.hasQuote() ? data.quote : null,
    'quote',
    forFieldValue,
  );

  // Add any Firestore field values
  data.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDataListFirestoreData(
  List<DataStruct>? datas,
) =>
    datas?.map((e) => getDataFirestoreData(e, true)).toList() ?? [];
