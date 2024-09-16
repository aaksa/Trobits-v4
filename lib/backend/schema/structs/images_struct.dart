// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ImagesStruct extends FFFirebaseStruct {
  ImagesStruct({
    String? alt,
    String? src,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _alt = alt,
        _src = src,
        super(firestoreUtilData);

  // "alt" field.
  String? _alt;
  String get alt => _alt ?? '';
  set alt(String? val) => _alt = val;

  bool hasAlt() => _alt != null;

  // "src" field.
  String? _src;
  String get src => _src ?? '';
  set src(String? val) => _src = val;

  bool hasSrc() => _src != null;

  static ImagesStruct fromMap(Map<String, dynamic> data) => ImagesStruct(
        alt: data['alt'] as String?,
        src: data['src'] as String?,
      );

  static ImagesStruct? maybeFromMap(dynamic data) =>
      data is Map ? ImagesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'alt': _alt,
        'src': _src,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'alt': serializeParam(
          _alt,
          ParamType.String,
        ),
        'src': serializeParam(
          _src,
          ParamType.String,
        ),
      }.withoutNulls;

  static ImagesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ImagesStruct(
        alt: deserializeParam(
          data['alt'],
          ParamType.String,
          false,
        ),
        src: deserializeParam(
          data['src'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ImagesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ImagesStruct && alt == other.alt && src == other.src;
  }

  @override
  int get hashCode => const ListEquality().hash([alt, src]);
}

ImagesStruct createImagesStruct({
  String? alt,
  String? src,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ImagesStruct(
      alt: alt,
      src: src,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ImagesStruct? updateImagesStruct(
  ImagesStruct? images, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    images
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addImagesStructData(
  Map<String, dynamic> firestoreData,
  ImagesStruct? images,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (images == null) {
    return;
  }
  if (images.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && images.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final imagesData = getImagesFirestoreData(images, forFieldValue);
  final nestedData = imagesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = images.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getImagesFirestoreData(
  ImagesStruct? images, [
  bool forFieldValue = false,
]) {
  if (images == null) {
    return {};
  }
  final firestoreData = mapToFirestore(images.toMap());

  // Add any Firestore field values
  images.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getImagesListFirestoreData(
  List<ImagesStruct>? imagess,
) =>
    imagess?.map((e) => getImagesFirestoreData(e, true)).toList() ?? [];
