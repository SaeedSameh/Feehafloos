import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AtmsRecord extends FirestoreRecord {
  AtmsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "bank_name" field.
  String? _bankName;
  String get bankName => _bankName ?? '';
  bool hasBankName() => _bankName != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "lastupdated" field.
  DateTime? _lastupdated;
  DateTime? get lastupdated => _lastupdated;
  bool hasLastupdated() => _lastupdated != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "bank_code" field.
  String? _bankCode;
  String get bankCode => _bankCode ?? '';
  bool hasBankCode() => _bankCode != null;

  void _initializeFields() {
    _bankName = snapshotData['bank_name'] as String?;
    _address = snapshotData['address'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _lastupdated = snapshotData['lastupdated'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _bankCode = snapshotData['bank_code'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('atms');

  static Stream<AtmsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AtmsRecord.fromSnapshot(s));

  static Future<AtmsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AtmsRecord.fromSnapshot(s));

  static AtmsRecord fromSnapshot(DocumentSnapshot snapshot) => AtmsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AtmsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AtmsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AtmsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AtmsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAtmsRecordData({
  String? bankName,
  String? address,
  LatLng? location,
  DateTime? lastupdated,
  String? status,
  String? bankCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bank_name': bankName,
      'address': address,
      'location': location,
      'lastupdated': lastupdated,
      'status': status,
      'bank_code': bankCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class AtmsRecordDocumentEquality implements Equality<AtmsRecord> {
  const AtmsRecordDocumentEquality();

  @override
  bool equals(AtmsRecord? e1, AtmsRecord? e2) {
    return e1?.bankName == e2?.bankName &&
        e1?.address == e2?.address &&
        e1?.location == e2?.location &&
        e1?.lastupdated == e2?.lastupdated &&
        e1?.status == e2?.status &&
        e1?.bankCode == e2?.bankCode;
  }

  @override
  int hash(AtmsRecord? e) => const ListEquality().hash([
        e?.bankName,
        e?.address,
        e?.location,
        e?.lastupdated,
        e?.status,
        e?.bankCode
      ]);

  @override
  bool isValidKey(Object? o) => o is AtmsRecord;
}
