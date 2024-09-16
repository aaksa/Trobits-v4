// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class NewsCmcStruct extends FFFirebaseStruct {
  NewsCmcStruct({
    String? subtitle,
    String? createdAt,
    String? sourceUrl,
    String? sourceName,
    String? title,
    String? releasedAt,
    String? cover,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _subtitle = subtitle,
        _createdAt = createdAt,
        _sourceUrl = sourceUrl,
        _sourceName = sourceName,
        _title = title,
        _releasedAt = releasedAt,
        _cover = cover,
        super(firestoreUtilData);

  // "subtitle" field.
  String? _subtitle;
  String get subtitle => _subtitle ?? '';
  set subtitle(String? val) => _subtitle = val;

  bool hasSubtitle() => _subtitle != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "source_url" field.
  String? _sourceUrl;
  String get sourceUrl => _sourceUrl ?? '';
  set sourceUrl(String? val) => _sourceUrl = val;

  bool hasSourceUrl() => _sourceUrl != null;

  // "source_name" field.
  String? _sourceName;
  String get sourceName => _sourceName ?? '';
  set sourceName(String? val) => _sourceName = val;

  bool hasSourceName() => _sourceName != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "released_at" field.
  String? _releasedAt;
  String get releasedAt => _releasedAt ?? '';
  set releasedAt(String? val) => _releasedAt = val;

  bool hasReleasedAt() => _releasedAt != null;

  // "cover" field.
  String? _cover;
  String get cover => _cover ?? '';
  set cover(String? val) => _cover = val;

  bool hasCover() => _cover != null;

  static NewsCmcStruct fromMap(Map<String, dynamic> data) => NewsCmcStruct(
        subtitle: data['subtitle'] as String?,
        createdAt: data['created_at'] as String?,
        sourceUrl: data['source_url'] as String?,
        sourceName: data['source_name'] as String?,
        title: data['title'] as String?,
        releasedAt: data['released_at'] as String?,
        cover: data['cover'] as String?,
      );

  static NewsCmcStruct? maybeFromMap(dynamic data) =>
      data is Map ? NewsCmcStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'subtitle': _subtitle,
        'created_at': _createdAt,
        'source_url': _sourceUrl,
        'source_name': _sourceName,
        'title': _title,
        'released_at': _releasedAt,
        'cover': _cover,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'subtitle': serializeParam(
          _subtitle,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'source_url': serializeParam(
          _sourceUrl,
          ParamType.String,
        ),
        'source_name': serializeParam(
          _sourceName,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'released_at': serializeParam(
          _releasedAt,
          ParamType.String,
        ),
        'cover': serializeParam(
          _cover,
          ParamType.String,
        ),
      }.withoutNulls;

  static NewsCmcStruct fromSerializableMap(Map<String, dynamic> data) =>
      NewsCmcStruct(
        subtitle: deserializeParam(
          data['subtitle'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        sourceUrl: deserializeParam(
          data['source_url'],
          ParamType.String,
          false,
        ),
        sourceName: deserializeParam(
          data['source_name'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        releasedAt: deserializeParam(
          data['released_at'],
          ParamType.String,
          false,
        ),
        cover: deserializeParam(
          data['cover'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NewsCmcStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NewsCmcStruct &&
        subtitle == other.subtitle &&
        createdAt == other.createdAt &&
        sourceUrl == other.sourceUrl &&
        sourceName == other.sourceName &&
        title == other.title &&
        releasedAt == other.releasedAt &&
        cover == other.cover;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [subtitle, createdAt, sourceUrl, sourceName, title, releasedAt, cover]);
}

NewsCmcStruct createNewsCmcStruct({
  String? subtitle,
  String? createdAt,
  String? sourceUrl,
  String? sourceName,
  String? title,
  String? releasedAt,
  String? cover,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NewsCmcStruct(
      subtitle: subtitle,
      createdAt: createdAt,
      sourceUrl: sourceUrl,
      sourceName: sourceName,
      title: title,
      releasedAt: releasedAt,
      cover: cover,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NewsCmcStruct? updateNewsCmcStruct(
  NewsCmcStruct? newsCmc, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    newsCmc
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNewsCmcStructData(
  Map<String, dynamic> firestoreData,
  NewsCmcStruct? newsCmc,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (newsCmc == null) {
    return;
  }
  if (newsCmc.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && newsCmc.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final newsCmcData = getNewsCmcFirestoreData(newsCmc, forFieldValue);
  final nestedData = newsCmcData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = newsCmc.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNewsCmcFirestoreData(
  NewsCmcStruct? newsCmc, [
  bool forFieldValue = false,
]) {
  if (newsCmc == null) {
    return {};
  }
  final firestoreData = mapToFirestore(newsCmc.toMap());

  // Add any Firestore field values
  newsCmc.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNewsCmcListFirestoreData(
  List<NewsCmcStruct>? newsCmcs,
) =>
    newsCmcs?.map((e) => getNewsCmcFirestoreData(e, true)).toList() ?? [];
