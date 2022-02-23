import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'video_courses_record.g.dart';

abstract class VideoCoursesRecord
    implements Built<VideoCoursesRecord, VideoCoursesRecordBuilder> {
  static Serializer<VideoCoursesRecord> get serializer =>
      _$videoCoursesRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'course_name')
  String get courseName;

  @nullable
  String get video;

  @nullable
  String get description;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(VideoCoursesRecordBuilder builder) => builder
    ..courseName = ''
    ..video = ''
    ..description = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('video_courses');

  static Stream<VideoCoursesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<VideoCoursesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  VideoCoursesRecord._();
  factory VideoCoursesRecord(
          [void Function(VideoCoursesRecordBuilder) updates]) =
      _$VideoCoursesRecord;

  static VideoCoursesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createVideoCoursesRecordData({
  String courseName,
  String video,
  String description,
}) =>
    serializers.toFirestore(
        VideoCoursesRecord.serializer,
        VideoCoursesRecord((v) => v
          ..courseName = courseName
          ..video = video
          ..description = description));
