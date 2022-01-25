import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'financial_planner_record.g.dart';

abstract class FinancialPlannerRecord
    implements Built<FinancialPlannerRecord, FinancialPlannerRecordBuilder> {
  static Serializer<FinancialPlannerRecord> get serializer =>
      _$financialPlannerRecordSerializer;

  @nullable
  String get uid;

  @nullable
  String get description;

  @nullable
  String get category;

  @nullable
  double get amount;

  @nullable
  DateTime get date;

  @nullable
  @BuiltValueField(wireName: 'wants_needs')
  String get wantsNeeds;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(FinancialPlannerRecordBuilder builder) =>
      builder
        ..uid = ''
        ..description = ''
        ..category = ''
        ..amount = 0.0
        ..wantsNeeds = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('financial_planner');

  static Stream<FinancialPlannerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<FinancialPlannerRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  FinancialPlannerRecord._();
  factory FinancialPlannerRecord(
          [void Function(FinancialPlannerRecordBuilder) updates]) =
      _$FinancialPlannerRecord;

  static FinancialPlannerRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createFinancialPlannerRecordData({
  String uid,
  String description,
  String category,
  double amount,
  DateTime date,
  String wantsNeeds,
}) =>
    serializers.toFirestore(
        FinancialPlannerRecord.serializer,
        FinancialPlannerRecord((f) => f
          ..uid = uid
          ..description = description
          ..category = category
          ..amount = amount
          ..date = date
          ..wantsNeeds = wantsNeeds));
