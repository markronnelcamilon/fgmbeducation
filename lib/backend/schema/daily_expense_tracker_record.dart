import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'daily_expense_tracker_record.g.dart';

abstract class DailyExpenseTrackerRecord
    implements
        Built<DailyExpenseTrackerRecord, DailyExpenseTrackerRecordBuilder> {
  static Serializer<DailyExpenseTrackerRecord> get serializer =>
      _$dailyExpenseTrackerRecordSerializer;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'subscription_id')
  String get subscriptionId;

  @nullable
  @BuiltValueField(wireName: 'starting_balance')
  double get startingBalance;

  @nullable
  @BuiltValueField(wireName: 'total_spending')
  double get totalSpending;

  @nullable
  int get total;

  @nullable
  @BuiltValueField(wireName: 'no_of_wants')
  int get noOfWants;

  @nullable
  @BuiltValueField(wireName: 'no_of_needs')
  String get noOfNeeds;

  @nullable
  @BuiltValueField(wireName: 'spending_wants')
  double get spendingWants;

  @nullable
  @BuiltValueField(wireName: 'spending_needs')
  double get spendingNeeds;

  @nullable
  @BuiltValueField(wireName: 'end_of_day_balance')
  double get endOfDayBalance;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DailyExpenseTrackerRecordBuilder builder) =>
      builder
        ..uid = ''
        ..subscriptionId = ''
        ..startingBalance = 0.0
        ..totalSpending = 0.0
        ..total = 0
        ..noOfWants = 0
        ..noOfNeeds = ''
        ..spendingWants = 0.0
        ..spendingNeeds = 0.0
        ..endOfDayBalance = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dailyExpenseTracker');

  static Stream<DailyExpenseTrackerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DailyExpenseTrackerRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  DailyExpenseTrackerRecord._();
  factory DailyExpenseTrackerRecord(
          [void Function(DailyExpenseTrackerRecordBuilder) updates]) =
      _$DailyExpenseTrackerRecord;

  static DailyExpenseTrackerRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDailyExpenseTrackerRecordData({
  String uid,
  String subscriptionId,
  double startingBalance,
  double totalSpending,
  int total,
  int noOfWants,
  String noOfNeeds,
  double spendingWants,
  double spendingNeeds,
  double endOfDayBalance,
}) =>
    serializers.toFirestore(
        DailyExpenseTrackerRecord.serializer,
        DailyExpenseTrackerRecord((d) => d
          ..uid = uid
          ..subscriptionId = subscriptionId
          ..startingBalance = startingBalance
          ..totalSpending = totalSpending
          ..total = total
          ..noOfWants = noOfWants
          ..noOfNeeds = noOfNeeds
          ..spendingWants = spendingWants
          ..spendingNeeds = spendingNeeds
          ..endOfDayBalance = endOfDayBalance));
