import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'expense_category_record.g.dart';

abstract class ExpenseCategoryRecord
    implements Built<ExpenseCategoryRecord, ExpenseCategoryRecordBuilder> {
  static Serializer<ExpenseCategoryRecord> get serializer =>
      _$expenseCategoryRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'category_name')
  String get categoryName;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ExpenseCategoryRecordBuilder builder) =>
      builder..categoryName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('expense_category');

  static Stream<ExpenseCategoryRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ExpenseCategoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  ExpenseCategoryRecord._();
  factory ExpenseCategoryRecord(
          [void Function(ExpenseCategoryRecordBuilder) updates]) =
      _$ExpenseCategoryRecord;

  static ExpenseCategoryRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createExpenseCategoryRecordData({
  String categoryName,
}) =>
    serializers.toFirestore(ExpenseCategoryRecord.serializer,
        ExpenseCategoryRecord((e) => e..categoryName = categoryName));
