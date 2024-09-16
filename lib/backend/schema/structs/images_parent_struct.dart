// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImagesParentStruct extends FFFirebaseStruct {
  ImagesParentStruct({
    List<ImagesStruct>? data,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _data = data,
        super(firestoreUtilData);

  // "data" field.
  List<ImagesStruct>? _data;
  List<ImagesStruct> get data => _data ?? const [];
  set data(List<ImagesStruct>? val) => _data = val;

  void updateData(Function(List<ImagesStruct>) updateFn) {
    updateFn(_data ??= []);
  }

  bool hasData() => _data != null;

  static ImagesParentStruct fromMap(Map<String, dynamic> data) =>
      ImagesParentStruct(
        data: getStructList(
          data['data'],
          ImagesStruct.fromMap,
        ),
      );

  static ImagesParentStruct? maybeFromMap(dynamic data) => data is Map
      ? ImagesParentStruct.fromMap(data.cast<String, dynamic>())
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

  static ImagesParentStruct fromSerializableMap(Map<String, dynamic> data) =>
      ImagesParentStruct(
        data: deserializeStructParam<ImagesStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: ImagesStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ImagesParentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ImagesParentStruct && listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

ImagesParentStruct createImagesParentStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ImagesParentStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ImagesParentStruct? updateImagesParentStruct(
  ImagesParentStruct? imagesParent, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    imagesParent
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addImagesParentStructData(
  Map<String, dynamic> firestoreData,
  ImagesParentStruct? imagesParent,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (imagesParent == null) {
    return;
  }
  if (imagesParent.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && imagesParent.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final imagesParentData =
      getImagesParentFirestoreData(imagesParent, forFieldValue);
  final nestedData =
      imagesParentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = imagesParent.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getImagesParentFirestoreData(
  ImagesParentStruct? imagesParent, [
  bool forFieldValue = false,
]) {
  if (imagesParent == null) {
    return {};
  }
  final firestoreData = mapToFirestore(imagesParent.toMap());

  // Add any Firestore field values
  imagesParent.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getImagesParentListFirestoreData(
  List<ImagesParentStruct>? imagesParents,
) =>
    imagesParents?.map((e) => getImagesParentFirestoreData(e, true)).toList() ??
    [];
