import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GlobalNotificationRecord extends FirestoreRecord {
  GlobalNotificationRecord._(
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

  // "fblink" field.
  String? _fblink;
  String get fblink => _fblink ?? '';
  bool hasFblink() => _fblink != null;

  // "instalink" field.
  String? _instalink;
  String get instalink => _instalink ?? '';
  bool hasInstalink() => _instalink != null;

  // "websitelink" field.
  String? _websitelink;
  String get websitelink => _websitelink ?? '';
  bool hasWebsitelink() => _websitelink != null;

  // "appversion" field.
  int? _appversion;
  int get appversion => _appversion ?? 0;
  bool hasAppversion() => _appversion != null;

  void _initializeFields() {
    _isActive = snapshotData['is_active'] as bool?;
    _message = snapshotData['message'] as String?;
    _title = snapshotData['title'] as String?;
    _image = snapshotData['image'] as String?;
    _fblink = snapshotData['fblink'] as String?;
    _instalink = snapshotData['instalink'] as String?;
    _websitelink = snapshotData['websitelink'] as String?;
    _appversion = castToType<int>(snapshotData['appversion']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('global_notification');

  static Stream<GlobalNotificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GlobalNotificationRecord.fromSnapshot(s));

  static Future<GlobalNotificationRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => GlobalNotificationRecord.fromSnapshot(s));

  static GlobalNotificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GlobalNotificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GlobalNotificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GlobalNotificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GlobalNotificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GlobalNotificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGlobalNotificationRecordData({
  bool? isActive,
  String? message,
  String? title,
  String? image,
  String? fblink,
  String? instalink,
  String? websitelink,
  int? appversion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'is_active': isActive,
      'message': message,
      'title': title,
      'image': image,
      'fblink': fblink,
      'instalink': instalink,
      'websitelink': websitelink,
      'appversion': appversion,
    }.withoutNulls,
  );

  return firestoreData;
}

class GlobalNotificationRecordDocumentEquality
    implements Equality<GlobalNotificationRecord> {
  const GlobalNotificationRecordDocumentEquality();

  @override
  bool equals(GlobalNotificationRecord? e1, GlobalNotificationRecord? e2) {
    return e1?.isActive == e2?.isActive &&
        e1?.message == e2?.message &&
        e1?.title == e2?.title &&
        e1?.image == e2?.image &&
        e1?.fblink == e2?.fblink &&
        e1?.instalink == e2?.instalink &&
        e1?.websitelink == e2?.websitelink &&
        e1?.appversion == e2?.appversion;
  }

  @override
  int hash(GlobalNotificationRecord? e) => const ListEquality().hash([
        e?.isActive,
        e?.message,
        e?.title,
        e?.image,
        e?.fblink,
        e?.instalink,
        e?.websitelink,
        e?.appversion
      ]);

  @override
  bool isValidKey(Object? o) => o is GlobalNotificationRecord;
}
