import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'twenty_one_days_counter_record.g.dart';

abstract class TwentyOneDaysCounterRecord
    implements
        Built<TwentyOneDaysCounterRecord, TwentyOneDaysCounterRecordBuilder> {
  static Serializer<TwentyOneDaysCounterRecord> get serializer =>
      _$twentyOneDaysCounterRecordSerializer;

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

  static void _initializeBuilder(TwentyOneDaysCounterRecordBuilder builder) =>
      builder
        ..uid = ''
        ..noOfDays = 0
        ..subscriptionId = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('twenty_one_days_counter');

  static Stream<TwentyOneDaysCounterRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TwentyOneDaysCounterRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  TwentyOneDaysCounterRecord._();
  factory TwentyOneDaysCounterRecord(
          [void Function(TwentyOneDaysCounterRecordBuilder) updates]) =
      _$TwentyOneDaysCounterRecord;

  static TwentyOneDaysCounterRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTwentyOneDaysCounterRecordData({
  String uid,
  int noOfDays,
  String subscriptionId,
  DateTime startDate,
  DateTime endDate,
}) =>
    serializers.toFirestore(
        TwentyOneDaysCounterRecord.serializer,
        TwentyOneDaysCounterRecord((t) => t
          ..uid = uid
          ..noOfDays = noOfDays
          ..subscriptionId = subscriptionId
          ..startDate = startDate
          ..endDate = endDate));
