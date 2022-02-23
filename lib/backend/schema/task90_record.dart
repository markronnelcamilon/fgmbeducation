import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'task90_record.g.dart';

abstract class Task90Record
    implements Built<Task90Record, Task90RecordBuilder> {
  static Serializer<Task90Record> get serializer => _$task90RecordSerializer;

  @nullable
  String get uid;

  @nullable
  String get taskName;

  @nullable
  bool get taskState;

  @nullable
  @BuiltValueField(wireName: 'subscription_id')
  String get subscriptionId;

  @nullable
  int get label;

  @nullable
  String get day;

  @nullable
  @BuiltValueField(wireName: 'ninety_days')
  DocumentReference get ninetyDays;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(Task90RecordBuilder builder) => builder
    ..uid = ''
    ..taskName = ''
    ..taskState = false
    ..subscriptionId = ''
    ..label = 0
    ..day = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('task90');

  static Stream<Task90Record> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<Task90Record> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  Task90Record._();
  factory Task90Record([void Function(Task90RecordBuilder) updates]) =
      _$Task90Record;

  static Task90Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTask90RecordData({
  String uid,
  String taskName,
  bool taskState,
  String subscriptionId,
  int label,
  String day,
  DocumentReference ninetyDays,
}) =>
    serializers.toFirestore(
        Task90Record.serializer,
        Task90Record((t) => t
          ..uid = uid
          ..taskName = taskName
          ..taskState = taskState
          ..subscriptionId = subscriptionId
          ..label = label
          ..day = day
          ..ninetyDays = ninetyDays));
