import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'first_name')
  String get firstName;

  @nullable
  @BuiltValueField(wireName: 'last_name')
  String get lastName;

  @nullable
  String get image;

  @nullable
  BuiltList<String> get goals;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  DocumentReference get subscriptions;

  @nullable
  @BuiltValueField(wireName: 'subscription_list')
  BuiltList<String> get subscriptionList;

  @nullable
  @BuiltValueField(wireName: 'twenty_one_days_counter')
  BuiltList<int> get twentyOneDaysCounter;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..firstName = ''
    ..lastName = ''
    ..image = ''
    ..goals = ListBuilder()
    ..email = ''
    ..photoUrl = ''
    ..uid = ''
    ..displayName = ''
    ..phoneNumber = ''
    ..subscriptionList = ListBuilder()
    ..twentyOneDaysCounter = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUsersRecordData({
  String firstName,
  String lastName,
  String image,
  String email,
  String photoUrl,
  DateTime createdTime,
  String uid,
  String displayName,
  String phoneNumber,
  DocumentReference subscriptions,
}) =>
    serializers.toFirestore(
        UsersRecord.serializer,
        UsersRecord((u) => u
          ..firstName = firstName
          ..lastName = lastName
          ..image = image
          ..goals = null
          ..email = email
          ..photoUrl = photoUrl
          ..createdTime = createdTime
          ..uid = uid
          ..displayName = displayName
          ..phoneNumber = phoneNumber
          ..subscriptions = subscriptions
          ..subscriptionList = null
          ..twentyOneDaysCounter = null));
