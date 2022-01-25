import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'quarterly_goals_record.g.dart';

abstract class QuarterlyGoalsRecord
    implements Built<QuarterlyGoalsRecord, QuarterlyGoalsRecordBuilder> {
  static Serializer<QuarterlyGoalsRecord> get serializer =>
      _$quarterlyGoalsRecordSerializer;

  @nullable
  String get uid;

  @nullable
  int get quarter;

  @nullable
  String get goals;

  @nullable
  String get label;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(QuarterlyGoalsRecordBuilder builder) => builder
    ..uid = ''
    ..quarter = 0
    ..goals = ''
    ..label = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quarterly_goals');

  static Stream<QuarterlyGoalsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<QuarterlyGoalsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  QuarterlyGoalsRecord._();
  factory QuarterlyGoalsRecord(
          [void Function(QuarterlyGoalsRecordBuilder) updates]) =
      _$QuarterlyGoalsRecord;

  static QuarterlyGoalsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createQuarterlyGoalsRecordData({
  String uid,
  int quarter,
  String goals,
  String label,
}) =>
    serializers.toFirestore(
        QuarterlyGoalsRecord.serializer,
        QuarterlyGoalsRecord((q) => q
          ..uid = uid
          ..quarter = quarter
          ..goals = goals
          ..label = label));
