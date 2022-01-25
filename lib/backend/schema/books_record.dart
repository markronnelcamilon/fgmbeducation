import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'books_record.g.dart';

abstract class BooksRecord implements Built<BooksRecord, BooksRecordBuilder> {
  static Serializer<BooksRecord> get serializer => _$booksRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'book_name')
  String get bookName;

  @nullable
  @BuiltValueField(wireName: 'amazon_link')
  String get amazonLink;

  @nullable
  @BuiltValueField(wireName: 'book_author')
  String get bookAuthor;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BooksRecordBuilder builder) => builder
    ..bookName = ''
    ..amazonLink = ''
    ..bookAuthor = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('books');

  static Stream<BooksRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BooksRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  BooksRecord._();
  factory BooksRecord([void Function(BooksRecordBuilder) updates]) =
      _$BooksRecord;

  static BooksRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBooksRecordData({
  String bookName,
  String amazonLink,
  String bookAuthor,
}) =>
    serializers.toFirestore(
        BooksRecord.serializer,
        BooksRecord((b) => b
          ..bookName = bookName
          ..amazonLink = amazonLink
          ..bookAuthor = bookAuthor));
