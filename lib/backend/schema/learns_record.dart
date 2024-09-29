import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LearnsRecord extends FirestoreRecord {
  LearnsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "subtitle" field.
  String? _subtitle;
  String get subtitle => _subtitle ?? '';
  bool hasSubtitle() => _subtitle != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "section" field.
  String? _section;
  String get section => _section ?? '';
  bool hasSection() => _section != null;

  // "isFeatured" field.
  bool? _isFeatured;
  bool get isFeatured => _isFeatured ?? false;
  bool hasIsFeatured() => _isFeatured != null;

  // "html" field.
  String? _html;
  String get html => _html ?? '';
  bool hasHtml() => _html != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _title = snapshotData['title'] as String?;
    _subtitle = snapshotData['subtitle'] as String?;
    _type = snapshotData['type'] as String?;
    _content = snapshotData['content'] as String?;
    _section = snapshotData['section'] as String?;
    _isFeatured = snapshotData['isFeatured'] as bool?;
    _html = snapshotData['html'] as String?;
    _video = snapshotData['video'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Learns');

  static Stream<LearnsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LearnsRecord.fromSnapshot(s));

  static Future<LearnsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LearnsRecord.fromSnapshot(s));

  static LearnsRecord fromSnapshot(DocumentSnapshot snapshot) => LearnsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LearnsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LearnsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LearnsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LearnsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLearnsRecordData({
  String? image,
  String? title,
  String? subtitle,
  String? type,
  String? content,
  String? section,
  bool? isFeatured,
  String? html,
  String? video,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'title': title,
      'subtitle': subtitle,
      'type': type,
      'content': content,
      'section': section,
      'isFeatured': isFeatured,
      'html': html,
      'video': video,
    }.withoutNulls,
  );

  return firestoreData;
}

class LearnsRecordDocumentEquality implements Equality<LearnsRecord> {
  const LearnsRecordDocumentEquality();

  @override
  bool equals(LearnsRecord? e1, LearnsRecord? e2) {
    return e1?.image == e2?.image &&
        e1?.title == e2?.title &&
        e1?.subtitle == e2?.subtitle &&
        e1?.type == e2?.type &&
        e1?.content == e2?.content &&
        e1?.section == e2?.section &&
        e1?.isFeatured == e2?.isFeatured &&
        e1?.html == e2?.html &&
        e1?.video == e2?.video;
  }

  @override
  int hash(LearnsRecord? e) => const ListEquality().hash([
        e?.image,
        e?.title,
        e?.subtitle,
        e?.type,
        e?.content,
        e?.section,
        e?.isFeatured,
        e?.html,
        e?.video
      ]);

  @override
  bool isValidKey(Object? o) => o is LearnsRecord;
}
