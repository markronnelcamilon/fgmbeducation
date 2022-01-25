import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'targets_record.g.dart';

abstract class TargetsRecord
    implements Built<TargetsRecord, TargetsRecordBuilder> {
  static Serializer<TargetsRecord> get serializer => _$targetsRecordSerializer;

  @nullable
  String get uid;

  @nullable
  DateTime get date;

  @nullable
  @BuiltValueField(wireName: 'target_detail')
  String get targetDetail;

  @nullable
  @BuiltValueField(wireName: 'target_done')
  bool get targetDone;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TargetsRecordBuilder builder) => builder
    ..uid = ''
    ..targetDetail = ''
    ..targetDone = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('targets');

  static Stream<TargetsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TargetsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TargetsRecord._();
  factory TargetsRecord([void Function(TargetsRecordBuilder) updates]) =
      _$TargetsRecord;

  static TargetsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTargetsRecordData({
  String uid,
  DateTime date,
  String targetDetail,
  bool targetDone,
}) =>
    serializers.toFirestore(
        TargetsRecord.serializer,
        TargetsRecord((t) => t
          ..uid = uid
          ..date = date
          ..targetDetail = targetDetail
          ..targetDone = targetDone));
