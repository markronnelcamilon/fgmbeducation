import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'subscription_record.g.dart';

abstract class SubscriptionRecord
    implements Built<SubscriptionRecord, SubscriptionRecordBuilder> {
  static Serializer<SubscriptionRecord> get serializer =>
      _$subscriptionRecordSerializer;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'subscription_name')
  String get subscriptionName;

  @nullable
  @BuiltValueField(wireName: 'subscription_date')
  DateTime get subscriptionDate;

  @nullable
  @BuiltValueField(wireName: 'subscription_cost')
  double get subscriptionCost;

  @nullable
  bool get active;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SubscriptionRecordBuilder builder) => builder
    ..uid = ''
    ..subscriptionName = ''
    ..subscriptionCost = 0.0
    ..active = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subscription');

  static Stream<SubscriptionRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SubscriptionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  SubscriptionRecord._();
  factory SubscriptionRecord(
          [void Function(SubscriptionRecordBuilder) updates]) =
      _$SubscriptionRecord;

  static SubscriptionRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSubscriptionRecordData({
  String uid,
  String subscriptionName,
  DateTime subscriptionDate,
  double subscriptionCost,
  bool active,
}) =>
    serializers.toFirestore(
        SubscriptionRecord.serializer,
        SubscriptionRecord((s) => s
          ..uid = uid
          ..subscriptionName = subscriptionName
          ..subscriptionDate = subscriptionDate
          ..subscriptionCost = subscriptionCost
          ..active = active));
