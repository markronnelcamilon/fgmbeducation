import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'subscritions_type_record.g.dart';

abstract class SubscritionsTypeRecord
    implements Built<SubscritionsTypeRecord, SubscritionsTypeRecordBuilder> {
  static Serializer<SubscritionsTypeRecord> get serializer =>
      _$subscritionsTypeRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'subscription_name')
  String get subscriptionName;

  @nullable
  @BuiltValueField(wireName: 'subscription_cost')
  double get subscriptionCost;

  @nullable
  bool get active;

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

  static void _initializeBuilder(SubscritionsTypeRecordBuilder builder) =>
      builder
        ..subscriptionName = ''
        ..subscriptionCost = 0.0
        ..active = false
        ..email = ''
        ..displayName = ''
        ..photoUrl = ''
        ..uid = ''
        ..phoneNumber = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subscritions_type');

  static Stream<SubscritionsTypeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SubscritionsTypeRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  SubscritionsTypeRecord._();
  factory SubscritionsTypeRecord(
          [void Function(SubscritionsTypeRecordBuilder) updates]) =
      _$SubscritionsTypeRecord;

  static SubscritionsTypeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSubscritionsTypeRecordData({
  String subscriptionName,
  double subscriptionCost,
  bool active,
  String email,
  String displayName,
  String photoUrl,
  String uid,
  DateTime createdTime,
  String phoneNumber,
}) =>
    serializers.toFirestore(
        SubscritionsTypeRecord.serializer,
        SubscritionsTypeRecord((s) => s
          ..subscriptionName = subscriptionName
          ..subscriptionCost = subscriptionCost
          ..active = active
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber));
