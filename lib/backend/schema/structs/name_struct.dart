// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NameStruct extends FFFirebaseStruct {
  NameStruct({
    String? name,
    double? circulatingsupply,
    String? data,
    CurrencyStruct? quote,
    String? symbol,
    String? statusTimestamp,
    String? type,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _circulatingsupply = circulatingsupply,
        _data = data,
        _quote = quote,
        _symbol = symbol,
        _statusTimestamp = statusTimestamp,
        _type = type,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "circulatingsupply" field.
  double? _circulatingsupply;
  double get circulatingsupply => _circulatingsupply ?? 0.0;
  set circulatingsupply(double? val) => _circulatingsupply = val;

  void incrementCirculatingsupply(double amount) =>
      circulatingsupply = circulatingsupply + amount;

  bool hasCirculatingsupply() => _circulatingsupply != null;

  // "data" field.
  String? _data;
  String get data => _data ?? '';
  set data(String? val) => _data = val;

  bool hasData() => _data != null;

  // "quote" field.
  CurrencyStruct? _quote;
  CurrencyStruct get quote => _quote ?? CurrencyStruct();
  set quote(CurrencyStruct? val) => _quote = val;

  void updateQuote(Function(CurrencyStruct) updateFn) {
    updateFn(_quote ??= CurrencyStruct());
  }

  bool hasQuote() => _quote != null;

  // "symbol" field.
  String? _symbol;
  String get symbol => _symbol ?? '';
  set symbol(String? val) => _symbol = val;

  bool hasSymbol() => _symbol != null;

  // "status_timestamp" field.
  String? _statusTimestamp;
  String get statusTimestamp => _statusTimestamp ?? '';
  set statusTimestamp(String? val) => _statusTimestamp = val;

  bool hasStatusTimestamp() => _statusTimestamp != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  static NameStruct fromMap(Map<String, dynamic> data) => NameStruct(
        name: data['name'] as String?,
        circulatingsupply: castToType<double>(data['circulatingsupply']),
        data: data['data'] as String?,
        quote: CurrencyStruct.maybeFromMap(data['quote']),
        symbol: data['symbol'] as String?,
        statusTimestamp: data['status_timestamp'] as String?,
        type: data['type'] as String?,
      );

  static NameStruct? maybeFromMap(dynamic data) =>
      data is Map ? NameStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'circulatingsupply': _circulatingsupply,
        'data': _data,
        'quote': _quote?.toMap(),
        'symbol': _symbol,
        'status_timestamp': _statusTimestamp,
        'type': _type,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'circulatingsupply': serializeParam(
          _circulatingsupply,
          ParamType.double,
        ),
        'data': serializeParam(
          _data,
          ParamType.String,
        ),
        'quote': serializeParam(
          _quote,
          ParamType.DataStruct,
        ),
        'symbol': serializeParam(
          _symbol,
          ParamType.String,
        ),
        'status_timestamp': serializeParam(
          _statusTimestamp,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
      }.withoutNulls;

  static NameStruct fromSerializableMap(Map<String, dynamic> data) =>
      NameStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        circulatingsupply: deserializeParam(
          data['circulatingsupply'],
          ParamType.double,
          false,
        ),
        data: deserializeParam(
          data['data'],
          ParamType.String,
          false,
        ),
        quote: deserializeStructParam(
          data['quote'],
          ParamType.DataStruct,
          false,
          structBuilder: CurrencyStruct.fromSerializableMap,
        ),
        symbol: deserializeParam(
          data['symbol'],
          ParamType.String,
          false,
        ),
        statusTimestamp: deserializeParam(
          data['status_timestamp'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NameStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NameStruct &&
        name == other.name &&
        circulatingsupply == other.circulatingsupply &&
        data == other.data &&
        quote == other.quote &&
        symbol == other.symbol &&
        statusTimestamp == other.statusTimestamp &&
        type == other.type;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [name, circulatingsupply, data, quote, symbol, statusTimestamp, type]);
}

NameStruct createNameStruct({
  String? name,
  double? circulatingsupply,
  String? data,
  CurrencyStruct? quote,
  String? symbol,
  String? statusTimestamp,
  String? type,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NameStruct(
      name: name,
      circulatingsupply: circulatingsupply,
      data: data,
      quote: quote ?? (clearUnsetFields ? CurrencyStruct() : null),
      symbol: symbol,
      statusTimestamp: statusTimestamp,
      type: type,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NameStruct? updateNameStruct(
  NameStruct? nameStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    nameStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNameStructData(
  Map<String, dynamic> firestoreData,
  NameStruct? nameStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (nameStruct == null) {
    return;
  }
  if (nameStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && nameStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final nameStructData = getNameFirestoreData(nameStruct, forFieldValue);
  final nestedData = nameStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = nameStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNameFirestoreData(
  NameStruct? nameStruct, [
  bool forFieldValue = false,
]) {
  if (nameStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(nameStruct.toMap());

  // Handle nested data for "quote" field.
  addCurrencyStructData(
    firestoreData,
    nameStruct.hasQuote() ? nameStruct.quote : null,
    'quote',
    forFieldValue,
  );

  // Add any Firestore field values
  nameStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNameListFirestoreData(
  List<NameStruct>? nameStructs,
) =>
    nameStructs?.map((e) => getNameFirestoreData(e, true)).toList() ?? [];
