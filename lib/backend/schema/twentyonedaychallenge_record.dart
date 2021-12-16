import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'twentyonedaychallenge_record.g.dart';

abstract class TwentyonedaychallengeRecord
    implements
        Built<TwentyonedaychallengeRecord, TwentyonedaychallengeRecordBuilder> {
  static Serializer<TwentyonedaychallengeRecord> get serializer =>
      _$twentyonedaychallengeRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'user_id')
  String get userId;

  @nullable
  bool get day1;

  @nullable
  bool get day2;

  @nullable
  bool get day3;

  @nullable
  bool get day4;

  @nullable
  bool get day5;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TwentyonedaychallengeRecordBuilder builder) =>
      builder
        ..userId = ''
        ..day1 = false
        ..day2 = false
        ..day3 = false
        ..day4 = false
        ..day5 = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('twentyonedaychallenge');

  static Stream<TwentyonedaychallengeRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  TwentyonedaychallengeRecord._();
  factory TwentyonedaychallengeRecord(
          [void Function(TwentyonedaychallengeRecordBuilder) updates]) =
      _$TwentyonedaychallengeRecord;

  static TwentyonedaychallengeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTwentyonedaychallengeRecordData({
  String userId,
  bool day1,
  bool day2,
  bool day3,
  bool day4,
  bool day5,
}) =>
    serializers.toFirestore(
        TwentyonedaychallengeRecord.serializer,
        TwentyonedaychallengeRecord((t) => t
          ..userId = userId
          ..day1 = day1
          ..day2 = day2
          ..day3 = day3
          ..day4 = day4
          ..day5 = day5));
