// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoinDataStruct extends FFFirebaseStruct {
  CoinDataStruct({
    String? name,
    String? symbol,
    int? cmcRank,
    double? totalSupply,
    double? circulatingSupply,
    CurrencyStruct? quote,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _symbol = symbol,
        _cmcRank = cmcRank,
        _totalSupply = totalSupply,
        _circulatingSupply = circulatingSupply,
        _quote = quote,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "symbol" field.
  String? _symbol;
  String get symbol => _symbol ?? '';
  set symbol(String? val) => _symbol = val;

  bool hasSymbol() => _symbol != null;

  // "cmc_rank" field.
  int? _cmcRank;
  int get cmcRank => _cmcRank ?? 0;
  set cmcRank(int? val) => _cmcRank = val;

  void incrementCmcRank(int amount) => cmcRank = cmcRank + amount;

  bool hasCmcRank() => _cmcRank != null;

  // "total_supply" field.
  double? _totalSupply;
  double get totalSupply => _totalSupply ?? 0.0;
  set totalSupply(double? val) => _totalSupply = val;

  void incrementTotalSupply(double amount) =>
      totalSupply = totalSupply + amount;

  bool hasTotalSupply() => _totalSupply != null;

  // "circulating_supply" field.
  double? _circulatingSupply;
  double get circulatingSupply => _circulatingSupply ?? 0.0;
  set circulatingSupply(double? val) => _circulatingSupply = val;

  void incrementCirculatingSupply(double amount) =>
      circulatingSupply = circulatingSupply + amount;

  bool hasCirculatingSupply() => _circulatingSupply != null;

  // "quote" field.
  CurrencyStruct? _quote;
  CurrencyStruct get quote => _quote ?? CurrencyStruct();
  set quote(CurrencyStruct? val) => _quote = val;

  void updateQuote(Function(CurrencyStruct) updateFn) {
    updateFn(_quote ??= CurrencyStruct());
  }

  bool hasQuote() => _quote != null;

  static CoinDataStruct fromMap(Map<String, dynamic> data) => CoinDataStruct(
        name: data['name'] as String?,
        symbol: data['symbol'] as String?,
        cmcRank: castToType<int>(data['cmc_rank']),
        totalSupply: castToType<double>(data['total_supply']),
        circulatingSupply: castToType<double>(data['circulating_supply']),
        quote: CurrencyStruct.maybeFromMap(data['quote']),
      );

  static CoinDataStruct? maybeFromMap(dynamic data) =>
      data is Map ? CoinDataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'symbol': _symbol,
        'cmc_rank': _cmcRank,
        'total_supply': _totalSupply,
        'circulating_supply': _circulatingSupply,
        'quote': _quote?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'symbol': serializeParam(
          _symbol,
          ParamType.String,
        ),
        'cmc_rank': serializeParam(
          _cmcRank,
          ParamType.int,
        ),
        'total_supply': serializeParam(
          _totalSupply,
          ParamType.double,
        ),
        'circulating_supply': serializeParam(
          _circulatingSupply,
          ParamType.double,
        ),
        'quote': serializeParam(
          _quote,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static CoinDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      CoinDataStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        symbol: deserializeParam(
          data['symbol'],
          ParamType.String,
          false,
        ),
        cmcRank: deserializeParam(
          data['cmc_rank'],
          ParamType.int,
          false,
        ),
        totalSupply: deserializeParam(
          data['total_supply'],
          ParamType.double,
          false,
        ),
        circulatingSupply: deserializeParam(
          data['circulating_supply'],
          ParamType.double,
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
  String toString() => 'CoinDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CoinDataStruct &&
        name == other.name &&
        symbol == other.symbol &&
        cmcRank == other.cmcRank &&
        totalSupply == other.totalSupply &&
        circulatingSupply == other.circulatingSupply &&
        quote == other.quote;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, symbol, cmcRank, totalSupply, circulatingSupply, quote]);
}

CoinDataStruct createCoinDataStruct({
  String? name,
  String? symbol,
  int? cmcRank,
  double? totalSupply,
  double? circulatingSupply,
  CurrencyStruct? quote,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CoinDataStruct(
      name: name,
      symbol: symbol,
      cmcRank: cmcRank,
      totalSupply: totalSupply,
      circulatingSupply: circulatingSupply,
      quote: quote ?? (clearUnsetFields ? CurrencyStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CoinDataStruct? updateCoinDataStruct(
  CoinDataStruct? coinData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    coinData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCoinDataStructData(
  Map<String, dynamic> firestoreData,
  CoinDataStruct? coinData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (coinData == null) {
    return;
  }
  if (coinData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && coinData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final coinDataData = getCoinDataFirestoreData(coinData, forFieldValue);
  final nestedData = coinDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = coinData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCoinDataFirestoreData(
  CoinDataStruct? coinData, [
  bool forFieldValue = false,
]) {
  if (coinData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(coinData.toMap());

  // Handle nested data for "quote" field.
  addCurrencyStructData(
    firestoreData,
    coinData.hasQuote() ? coinData.quote : null,
    'quote',
    forFieldValue,
  );

  // Add any Firestore field values
  coinData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCoinDataListFirestoreData(
  List<CoinDataStruct>? coinDatas,
) =>
    coinDatas?.map((e) => getCoinDataFirestoreData(e, true)).toList() ?? [];
