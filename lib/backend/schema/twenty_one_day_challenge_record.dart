import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'twenty_one_day_challenge_record.g.dart';

abstract class TwentyOneDayChallengeRecord
    implements
        Built<TwentyOneDayChallengeRecord, TwentyOneDayChallengeRecordBuilder> {
  static Serializer<TwentyOneDayChallengeRecord> get serializer =>
      _$twentyOneDayChallengeRecordSerializer;

  @nullable
  String get subscription;

  @nullable
  @BuiltValueField(wireName: 'subscription_date')
  DateTime get subscriptionDate;

  @nullable
  String get user;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TwentyOneDayChallengeRecordBuilder builder) =>
      builder
        ..subscription = ''
        ..user = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('twenty_one_day_challenge');

  static Stream<TwentyOneDayChallengeRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  TwentyOneDayChallengeRecord._();
  factory TwentyOneDayChallengeRecord(
          [void Function(TwentyOneDayChallengeRecordBuilder) updates]) =
      _$TwentyOneDayChallengeRecord;

  static TwentyOneDayChallengeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTwentyOneDayChallengeRecordData({
  String subscription,
  DateTime subscriptionDate,
  String user,
}) =>
    serializers.toFirestore(
        TwentyOneDayChallengeRecord.serializer,
        TwentyOneDayChallengeRecord((t) => t
          ..subscription = subscription
          ..subscriptionDate = subscriptionDate
          ..user = user));
