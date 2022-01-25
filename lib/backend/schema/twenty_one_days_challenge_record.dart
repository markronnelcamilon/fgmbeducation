import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'twenty_one_days_challenge_record.g.dart';

abstract class TwentyOneDaysChallengeRecord
    implements
        Built<TwentyOneDaysChallengeRecord,
            TwentyOneDaysChallengeRecordBuilder> {
  static Serializer<TwentyOneDaysChallengeRecord> get serializer =>
      _$twentyOneDaysChallengeRecordSerializer;

  @nullable
  String get uid;

  @nullable
  String get day;

  @nullable
  DateTime get date;

  @nullable
  bool get completed;

  @nullable
  int get label;

  @nullable
  bool get task1;

  @nullable
  bool get task2;

  @nullable
  bool get task3;

  @nullable
  bool get task4;

  @nullable
  bool get task5;

  @nullable
  DocumentReference get counter;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TwentyOneDaysChallengeRecordBuilder builder) =>
      builder
        ..uid = ''
        ..day = ''
        ..completed = false
        ..label = 0
        ..task1 = false
        ..task2 = false
        ..task3 = false
        ..task4 = false
        ..task5 = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('twenty_one_days_challenge');

  static Stream<TwentyOneDaysChallengeRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TwentyOneDaysChallengeRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  TwentyOneDaysChallengeRecord._();
  factory TwentyOneDaysChallengeRecord(
          [void Function(TwentyOneDaysChallengeRecordBuilder) updates]) =
      _$TwentyOneDaysChallengeRecord;

  static TwentyOneDaysChallengeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTwentyOneDaysChallengeRecordData({
  String uid,
  String day,
  DateTime date,
  bool completed,
  int label,
  bool task1,
  bool task2,
  bool task3,
  bool task4,
  bool task5,
  DocumentReference counter,
}) =>
    serializers.toFirestore(
        TwentyOneDaysChallengeRecord.serializer,
        TwentyOneDaysChallengeRecord((t) => t
          ..uid = uid
          ..day = day
          ..date = date
          ..completed = completed
          ..label = label
          ..task1 = task1
          ..task2 = task2
          ..task3 = task3
          ..task4 = task4
          ..task5 = task5
          ..counter = counter));
