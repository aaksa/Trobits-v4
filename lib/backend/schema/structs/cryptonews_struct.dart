// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CryptonewsStruct extends FFFirebaseStruct {
  CryptonewsStruct({
    String? newsUrl,
    String? title,
    String? text,
    String? sourceName,
    String? date,
    String? sentiment,
    String? imageUrl,
    String? type,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _newsUrl = newsUrl,
        _title = title,
        _text = text,
        _sourceName = sourceName,
        _date = date,
        _sentiment = sentiment,
        _imageUrl = imageUrl,
        _type = type,
        super(firestoreUtilData);

  // "news_url" field.
  String? _newsUrl;
  String get newsUrl => _newsUrl ?? '';
  set newsUrl(String? val) => _newsUrl = val;

  bool hasNewsUrl() => _newsUrl != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "source_name" field.
  String? _sourceName;
  String get sourceName => _sourceName ?? '';
  set sourceName(String? val) => _sourceName = val;

  bool hasSourceName() => _sourceName != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  // "sentiment" field.
  String? _sentiment;
  String get sentiment => _sentiment ?? '';
  set sentiment(String? val) => _sentiment = val;

  bool hasSentiment() => _sentiment != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  set imageUrl(String? val) => _imageUrl = val;

  bool hasImageUrl() => _imageUrl != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  static CryptonewsStruct fromMap(Map<String, dynamic> data) =>
      CryptonewsStruct(
        newsUrl: data['news_url'] as String?,
        title: data['title'] as String?,
        text: data['text'] as String?,
        sourceName: data['source_name'] as String?,
        date: data['date'] as String?,
        sentiment: data['sentiment'] as String?,
        imageUrl: data['image_url'] as String?,
        type: data['type'] as String?,
      );

  static CryptonewsStruct? maybeFromMap(dynamic data) => data is Map
      ? CryptonewsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'news_url': _newsUrl,
        'title': _title,
        'text': _text,
        'source_name': _sourceName,
        'date': _date,
        'sentiment': _sentiment,
        'image_url': _imageUrl,
        'type': _type,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'news_url': serializeParam(
          _newsUrl,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'source_name': serializeParam(
          _sourceName,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'sentiment': serializeParam(
          _sentiment,
          ParamType.String,
        ),
        'image_url': serializeParam(
          _imageUrl,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
      }.withoutNulls;

  static CryptonewsStruct fromSerializableMap(Map<String, dynamic> data) =>
      CryptonewsStruct(
        newsUrl: deserializeParam(
          data['news_url'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        sourceName: deserializeParam(
          data['source_name'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        sentiment: deserializeParam(
          data['sentiment'],
          ParamType.String,
          false,
        ),
        imageUrl: deserializeParam(
          data['image_url'],
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
  String toString() => 'CryptonewsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CryptonewsStruct &&
        newsUrl == other.newsUrl &&
        title == other.title &&
        text == other.text &&
        sourceName == other.sourceName &&
        date == other.date &&
        sentiment == other.sentiment &&
        imageUrl == other.imageUrl &&
        type == other.type;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [newsUrl, title, text, sourceName, date, sentiment, imageUrl, type]);
}

CryptonewsStruct createCryptonewsStruct({
  String? newsUrl,
  String? title,
  String? text,
  String? sourceName,
  String? date,
  String? sentiment,
  String? imageUrl,
  String? type,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CryptonewsStruct(
      newsUrl: newsUrl,
      title: title,
      text: text,
      sourceName: sourceName,
      date: date,
      sentiment: sentiment,
      imageUrl: imageUrl,
      type: type,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CryptonewsStruct? updateCryptonewsStruct(
  CryptonewsStruct? cryptonews, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cryptonews
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCryptonewsStructData(
  Map<String, dynamic> firestoreData,
  CryptonewsStruct? cryptonews,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cryptonews == null) {
    return;
  }
  if (cryptonews.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cryptonews.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cryptonewsData = getCryptonewsFirestoreData(cryptonews, forFieldValue);
  final nestedData = cryptonewsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cryptonews.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCryptonewsFirestoreData(
  CryptonewsStruct? cryptonews, [
  bool forFieldValue = false,
]) {
  if (cryptonews == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cryptonews.toMap());

  // Add any Firestore field values
  cryptonews.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCryptonewsListFirestoreData(
  List<CryptonewsStruct>? cryptonewss,
) =>
    cryptonewss?.map((e) => getCryptonewsFirestoreData(e, true)).toList() ?? [];
