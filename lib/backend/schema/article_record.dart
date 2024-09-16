import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArticleRecord extends FirestoreRecord {
  ArticleRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "Content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  void _initializeFields() {
    _title = snapshotData['Title'] as String?;
    _content = snapshotData['Content'] as String?;
    _photo = snapshotData['photo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Article');

  static Stream<ArticleRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ArticleRecord.fromSnapshot(s));

  static Future<ArticleRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ArticleRecord.fromSnapshot(s));

  static ArticleRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ArticleRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ArticleRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ArticleRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ArticleRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ArticleRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createArticleRecordData({
  String? title,
  String? content,
  String? photo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Title': title,
      'Content': content,
      'photo': photo,
    }.withoutNulls,
  );

  return firestoreData;
}

class ArticleRecordDocumentEquality implements Equality<ArticleRecord> {
  const ArticleRecordDocumentEquality();

  @override
  bool equals(ArticleRecord? e1, ArticleRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.content == e2?.content &&
        e1?.photo == e2?.photo;
  }

  @override
  int hash(ArticleRecord? e) =>
      const ListEquality().hash([e?.title, e?.content, e?.photo]);

  @override
  bool isValidKey(Object? o) => o is ArticleRecord;
}
