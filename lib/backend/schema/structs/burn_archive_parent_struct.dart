// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BurnArchiveParentStruct extends FFFirebaseStruct {
  BurnArchiveParentStruct({
    List<BurnArchiveStruct>? data,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _data = data,
        super(firestoreUtilData);

  // "data" field.
  List<BurnArchiveStruct>? _data;
  List<BurnArchiveStruct> get data => _data ?? const [];
  set data(List<BurnArchiveStruct>? val) => _data = val;

  void updateData(Function(List<BurnArchiveStruct>) updateFn) {
    updateFn(_data ??= []);
  }

  bool hasData() => _data != null;

  static BurnArchiveParentStruct fromMap(Map<String, dynamic> data) =>
      BurnArchiveParentStruct(
        data: getStructList(
          data['data'],
          BurnArchiveStruct.fromMap,
        ),
      );

  static BurnArchiveParentStruct? maybeFromMap(dynamic data) => data is Map
      ? BurnArchiveParentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'data': _data?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static BurnArchiveParentStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      BurnArchiveParentStruct(
        data: deserializeStructParam<BurnArchiveStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: BurnArchiveStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'BurnArchiveParentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is BurnArchiveParentStruct &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

BurnArchiveParentStruct createBurnArchiveParentStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BurnArchiveParentStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BurnArchiveParentStruct? updateBurnArchiveParentStruct(
  BurnArchiveParentStruct? burnArchiveParent, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    burnArchiveParent
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBurnArchiveParentStructData(
  Map<String, dynamic> firestoreData,
  BurnArchiveParentStruct? burnArchiveParent,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (burnArchiveParent == null) {
    return;
  }
  if (burnArchiveParent.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && burnArchiveParent.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final burnArchiveParentData =
      getBurnArchiveParentFirestoreData(burnArchiveParent, forFieldValue);
  final nestedData =
      burnArchiveParentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = burnArchiveParent.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBurnArchiveParentFirestoreData(
  BurnArchiveParentStruct? burnArchiveParent, [
  bool forFieldValue = false,
]) {
  if (burnArchiveParent == null) {
    return {};
  }
  final firestoreData = mapToFirestore(burnArchiveParent.toMap());

  // Add any Firestore field values
  burnArchiveParent.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBurnArchiveParentListFirestoreData(
  List<BurnArchiveParentStruct>? burnArchiveParents,
) =>
    burnArchiveParents
        ?.map((e) => getBurnArchiveParentFirestoreData(e, true))
        .toList() ??
    [];
