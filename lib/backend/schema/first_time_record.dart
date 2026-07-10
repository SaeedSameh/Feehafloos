import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FirstTimeRecord extends FirestoreRecord {
  FirstTimeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "is_active" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _isActive = snapshotData['is_active'] as bool?;
    _message = snapshotData['message'] as String?;
    _title = snapshotData['title'] as String?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('FirstTime');

  static Stream<FirstTimeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FirstTimeRecord.fromSnapshot(s));

  static Future<FirstTimeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FirstTimeRecord.fromSnapshot(s));

  static FirstTimeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FirstTimeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FirstTimeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FirstTimeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FirstTimeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FirstTimeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFirstTimeRecordData({
  bool? isActive,
  String? message,
  String? title,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'is_active': isActive,
      'message': message,
      'title': title,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class FirstTimeRecordDocumentEquality implements Equality<FirstTimeRecord> {
  const FirstTimeRecordDocumentEquality();

  @override
  bool equals(FirstTimeRecord? e1, FirstTimeRecord? e2) {
    return e1?.isActive == e2?.isActive &&
        e1?.message == e2?.message &&
        e1?.title == e2?.title &&
        e1?.image == e2?.image;
  }

  @override
  int hash(FirstTimeRecord? e) =>
      const ListEquality().hash([e?.isActive, e?.message, e?.title, e?.image]);

  @override
  bool isValidKey(Object? o) => o is FirstTimeRecord;
}
