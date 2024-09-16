// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewsStruct extends FFFirebaseStruct {
  NewsStruct({
    String? title,
    String? link,
    List<ImagesStruct>? images,
    String? lastFetched,
    List<String>? text,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _link = link,
        _images = images,
        _lastFetched = lastFetched,
        _text = text,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  set link(String? val) => _link = val;

  bool hasLink() => _link != null;

  // "images" field.
  List<ImagesStruct>? _images;
  List<ImagesStruct> get images => _images ?? const [];
  set images(List<ImagesStruct>? val) => _images = val;

  void updateImages(Function(List<ImagesStruct>) updateFn) {
    updateFn(_images ??= []);
  }

  bool hasImages() => _images != null;

  // "last_fetched" field.
  String? _lastFetched;
  String get lastFetched => _lastFetched ?? '';
  set lastFetched(String? val) => _lastFetched = val;

  bool hasLastFetched() => _lastFetched != null;

  // "text" field.
  List<String>? _text;
  List<String> get text => _text ?? const [];
  set text(List<String>? val) => _text = val;

  void updateText(Function(List<String>) updateFn) {
    updateFn(_text ??= []);
  }

  bool hasText() => _text != null;

  static NewsStruct fromMap(Map<String, dynamic> data) => NewsStruct(
        title: data['title'] as String?,
        link: data['link'] as String?,
        images: getStructList(
          data['images'],
          ImagesStruct.fromMap,
        ),
        lastFetched: data['last_fetched'] as String?,
        text: getDataList(data['text']),
      );

  static NewsStruct? maybeFromMap(dynamic data) =>
      data is Map ? NewsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'link': _link,
        'images': _images?.map((e) => e.toMap()).toList(),
        'last_fetched': _lastFetched,
        'text': _text,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'link': serializeParam(
          _link,
          ParamType.String,
        ),
        'images': serializeParam(
          _images,
          ParamType.DataStruct,
          isList: true,
        ),
        'last_fetched': serializeParam(
          _lastFetched,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static NewsStruct fromSerializableMap(Map<String, dynamic> data) =>
      NewsStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        link: deserializeParam(
          data['link'],
          ParamType.String,
          false,
        ),
        images: deserializeStructParam<ImagesStruct>(
          data['images'],
          ParamType.DataStruct,
          true,
          structBuilder: ImagesStruct.fromSerializableMap,
        ),
        lastFetched: deserializeParam(
          data['last_fetched'],
          ParamType.String,
          false,
        ),
        text: deserializeParam<String>(
          data['text'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'NewsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is NewsStruct &&
        title == other.title &&
        link == other.link &&
        listEquality.equals(images, other.images) &&
        lastFetched == other.lastFetched &&
        listEquality.equals(text, other.text);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([title, link, images, lastFetched, text]);
}

NewsStruct createNewsStruct({
  String? title,
  String? link,
  String? lastFetched,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NewsStruct(
      title: title,
      link: link,
      lastFetched: lastFetched,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NewsStruct? updateNewsStruct(
  NewsStruct? news, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    news
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNewsStructData(
  Map<String, dynamic> firestoreData,
  NewsStruct? news,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (news == null) {
    return;
  }
  if (news.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && news.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final newsData = getNewsFirestoreData(news, forFieldValue);
  final nestedData = newsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = news.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNewsFirestoreData(
  NewsStruct? news, [
  bool forFieldValue = false,
]) {
  if (news == null) {
    return {};
  }
  final firestoreData = mapToFirestore(news.toMap());

  // Add any Firestore field values
  news.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNewsListFirestoreData(
  List<NewsStruct>? newss,
) =>
    newss?.map((e) => getNewsFirestoreData(e, true)).toList() ?? [];
