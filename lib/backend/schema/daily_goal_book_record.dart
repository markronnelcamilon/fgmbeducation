import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'daily_goal_book_record.g.dart';

abstract class DailyGoalBookRecord
    implements Built<DailyGoalBookRecord, DailyGoalBookRecordBuilder> {
  static Serializer<DailyGoalBookRecord> get serializer =>
      _$dailyGoalBookRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'user_id')
  String get userId;

  @nullable
  @BuiltValueField(wireName: 'subscription_id')
  String get subscriptionId;

  @nullable
  DateTime get time;

  @nullable
  String get goal;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DailyGoalBookRecordBuilder builder) => builder
    ..userId = ''
    ..subscriptionId = ''
    ..goal = ''
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('daily_goal_book');

  static Stream<DailyGoalBookRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DailyGoalBookRecord._();
  factory DailyGoalBookRecord(
          [void Function(DailyGoalBookRecordBuilder) updates]) =
      _$DailyGoalBookRecord;

  static DailyGoalBookRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDailyGoalBookRecordData({
  String userId,
  String subscriptionId,
  DateTime time,
  String goal,
  String email,
  String displayName,
  String photoUrl,
  String uid,
  DateTime createdTime,
  String phoneNumber,
}) =>
    serializers.toFirestore(
        DailyGoalBookRecord.serializer,
        DailyGoalBookRecord((d) => d
          ..userId = userId
          ..subscriptionId = subscriptionId
          ..time = time
          ..goal = goal
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber));
