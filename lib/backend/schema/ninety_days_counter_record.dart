import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'ninety_days_counter_record.g.dart';

abstract class NinetyDaysCounterRecord
    implements Built<NinetyDaysCounterRecord, NinetyDaysCounterRecordBuilder> {
  static Serializer<NinetyDaysCounterRecord> get serializer =>
      _$ninetyDaysCounterRecordSerializer;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'no_of_days')
  int get noOfDays;

  @nullable
  @BuiltValueField(wireName: 'subscription_id')
  String get subscriptionId;

  @nullable
  @BuiltValueField(wireName: 'start_date')
  DateTime get startDate;

  @nullable
  @BuiltValueField(wireName: 'end_date')
  DateTime get endDate;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(NinetyDaysCounterRecordBuilder builder) =>
      builder
        ..uid = ''
        ..noOfDays = 0
        ..subscriptionId = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ninety_days_counter');

  static Stream<NinetyDaysCounterRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<NinetyDaysCounterRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  NinetyDaysCounterRecord._();
  factory NinetyDaysCounterRecord(
          [void Function(NinetyDaysCounterRecordBuilder) updates]) =
      _$NinetyDaysCounterRecord;

  static NinetyDaysCounterRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createNinetyDaysCounterRecordData({
  String uid,
  int noOfDays,
  String subscriptionId,
  DateTime startDate,
  DateTime endDate,
}) =>
    serializers.toFirestore(
        NinetyDaysCounterRecord.serializer,
        NinetyDaysCounterRecord((n) => n
          ..uid = uid
          ..noOfDays = noOfDays
          ..subscriptionId = subscriptionId
          ..startDate = startDate
          ..endDate = endDate));
