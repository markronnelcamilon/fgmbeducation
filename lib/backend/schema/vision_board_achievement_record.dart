import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'vision_board_achievement_record.g.dart';

abstract class VisionBoardAchievementRecord
    implements
        Built<VisionBoardAchievementRecord,
            VisionBoardAchievementRecordBuilder> {
  static Serializer<VisionBoardAchievementRecord> get serializer =>
      _$visionBoardAchievementRecordSerializer;

  @nullable
  String get uid;

  @nullable
  String get image;

  @nullable
  DateTime get date;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(VisionBoardAchievementRecordBuilder builder) =>
      builder
        ..uid = ''
        ..image = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('vision_board_achievement');

  static Stream<VisionBoardAchievementRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<VisionBoardAchievementRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  VisionBoardAchievementRecord._();
  factory VisionBoardAchievementRecord(
          [void Function(VisionBoardAchievementRecordBuilder) updates]) =
      _$VisionBoardAchievementRecord;

  static VisionBoardAchievementRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createVisionBoardAchievementRecordData({
  String uid,
  String image,
  DateTime date,
}) =>
    serializers.toFirestore(
        VisionBoardAchievementRecord.serializer,
        VisionBoardAchievementRecord((v) => v
          ..uid = uid
          ..image = image
          ..date = date));
