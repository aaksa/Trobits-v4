// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CurrencyStruct extends FFFirebaseStruct {
  CurrencyStruct({
    CurrencycCoinStruct? usd,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _usd = usd,
        super(firestoreUtilData);

  // "USD" field.
  CurrencycCoinStruct? _usd;
  CurrencycCoinStruct get usd => _usd ?? CurrencycCoinStruct();
  set usd(CurrencycCoinStruct? val) => _usd = val;

  void updateUsd(Function(CurrencycCoinStruct) updateFn) {
    updateFn(_usd ??= CurrencycCoinStruct());
  }

  bool hasUsd() => _usd != null;

  static CurrencyStruct fromMap(Map<String, dynamic> data) => CurrencyStruct(
        usd: CurrencycCoinStruct.maybeFromMap(data['USD']),
      );

  static CurrencyStruct? maybeFromMap(dynamic data) =>
      data is Map ? CurrencyStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'USD': _usd?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'USD': serializeParam(
          _usd,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static CurrencyStruct fromSerializableMap(Map<String, dynamic> data) =>
      CurrencyStruct(
        usd: deserializeStructParam(
          data['USD'],
          ParamType.DataStruct,
          false,
          structBuilder: CurrencycCoinStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CurrencyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CurrencyStruct && usd == other.usd;
  }

  @override
  int get hashCode => const ListEquality().hash([usd]);
}

CurrencyStruct createCurrencyStruct({
  CurrencycCoinStruct? usd,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CurrencyStruct(
      usd: usd ?? (clearUnsetFields ? CurrencycCoinStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CurrencyStruct? updateCurrencyStruct(
  CurrencyStruct? currency, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    currency
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCurrencyStructData(
  Map<String, dynamic> firestoreData,
  CurrencyStruct? currency,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (currency == null) {
    return;
  }
  if (currency.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && currency.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final currencyData = getCurrencyFirestoreData(currency, forFieldValue);
  final nestedData = currencyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = currency.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCurrencyFirestoreData(
  CurrencyStruct? currency, [
  bool forFieldValue = false,
]) {
  if (currency == null) {
    return {};
  }
  final firestoreData = mapToFirestore(currency.toMap());

  // Handle nested data for "USD" field.
  addCurrencycCoinStructData(
    firestoreData,
    currency.hasUsd() ? currency.usd : null,
    'USD',
    forFieldValue,
  );

  // Add any Firestore field values
  currency.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCurrencyListFirestoreData(
  List<CurrencyStruct>? currencys,
) =>
    currencys?.map((e) => getCurrencyFirestoreData(e, true)).toList() ?? [];
