import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../flutter_flow/flutter_flow_util.dart';

import 'schema/users_record.dart';
import 'schema/subscritions_type_record.dart';
import 'schema/goal_book_record.dart';
import 'schema/subscription_record.dart';
import 'schema/twenty_one_days_challenge_record.dart';
import 'schema/financial_planner_record.dart';
import 'schema/expense_category_record.dart';
import 'schema/ninety_days_challenge_record.dart';
import 'schema/vision_board_achievement_record.dart';
import 'schema/vision_board_record.dart';
import 'schema/books_record.dart';
import 'schema/daily_expense_tracker_record.dart';
import 'schema/twenty_one_days_counter_record.dart';
import 'schema/task21_record.dart';
import 'schema/quarterly_goals_record.dart';
import 'schema/daily_success_planner_record.dart';
import 'schema/targets_record.dart';
import 'schema/task90_record.dart';
import 'schema/ninety_days_counter_record.dart';
import 'schema/video_courses_record.dart';
import 'schema/serializers.dart';

export 'package:cloud_firestore/cloud_firestore.dart';
export 'schema/index.dart';
export 'schema/serializers.dart';

export 'schema/users_record.dart';
export 'schema/subscritions_type_record.dart';
export 'schema/goal_book_record.dart';
export 'schema/subscription_record.dart';
export 'schema/twenty_one_days_challenge_record.dart';
export 'schema/financial_planner_record.dart';
export 'schema/expense_category_record.dart';
export 'schema/ninety_days_challenge_record.dart';
export 'schema/vision_board_achievement_record.dart';
export 'schema/vision_board_record.dart';
export 'schema/books_record.dart';
export 'schema/daily_expense_tracker_record.dart';
export 'schema/twenty_one_days_counter_record.dart';
export 'schema/task21_record.dart';
export 'schema/quarterly_goals_record.dart';
export 'schema/daily_success_planner_record.dart';
export 'schema/targets_record.dart';
export 'schema/task90_record.dart';
export 'schema/ninety_days_counter_record.dart';
export 'schema/video_courses_record.dart';

/// Functions to query UsersRecords (as a Stream and as a Future).
Stream<List<UsersRecord>> queryUsersRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(UsersRecord.collection, UsersRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<UsersRecord>> queryUsersRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(UsersRecord.collection, UsersRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query SubscritionsTypeRecords (as a Stream and as a Future).
Stream<List<SubscritionsTypeRecord>> querySubscritionsTypeRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        SubscritionsTypeRecord.collection, SubscritionsTypeRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<SubscritionsTypeRecord>> querySubscritionsTypeRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        SubscritionsTypeRecord.collection, SubscritionsTypeRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query GoalBookRecords (as a Stream and as a Future).
Stream<List<GoalBookRecord>> queryGoalBookRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(GoalBookRecord.collection, GoalBookRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<GoalBookRecord>> queryGoalBookRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(GoalBookRecord.collection, GoalBookRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query SubscriptionRecords (as a Stream and as a Future).
Stream<List<SubscriptionRecord>> querySubscriptionRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        SubscriptionRecord.collection, SubscriptionRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<SubscriptionRecord>> querySubscriptionRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        SubscriptionRecord.collection, SubscriptionRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query TwentyOneDaysChallengeRecords (as a Stream and as a Future).
Stream<List<TwentyOneDaysChallengeRecord>> queryTwentyOneDaysChallengeRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(TwentyOneDaysChallengeRecord.collection,
        TwentyOneDaysChallengeRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<TwentyOneDaysChallengeRecord>>
    queryTwentyOneDaysChallengeRecordOnce(
            {Query Function(Query) queryBuilder,
            int limit = -1,
            bool singleRecord = false}) =>
        queryCollectionOnce(TwentyOneDaysChallengeRecord.collection,
            TwentyOneDaysChallengeRecord.serializer,
            queryBuilder: queryBuilder,
            limit: limit,
            singleRecord: singleRecord);

/// Functions to query FinancialPlannerRecords (as a Stream and as a Future).
Stream<List<FinancialPlannerRecord>> queryFinancialPlannerRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        FinancialPlannerRecord.collection, FinancialPlannerRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<FinancialPlannerRecord>> queryFinancialPlannerRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        FinancialPlannerRecord.collection, FinancialPlannerRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query ExpenseCategoryRecords (as a Stream and as a Future).
Stream<List<ExpenseCategoryRecord>> queryExpenseCategoryRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        ExpenseCategoryRecord.collection, ExpenseCategoryRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<ExpenseCategoryRecord>> queryExpenseCategoryRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        ExpenseCategoryRecord.collection, ExpenseCategoryRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query NinetyDaysChallengeRecords (as a Stream and as a Future).
Stream<List<NinetyDaysChallengeRecord>> queryNinetyDaysChallengeRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(NinetyDaysChallengeRecord.collection,
        NinetyDaysChallengeRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<NinetyDaysChallengeRecord>> queryNinetyDaysChallengeRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(NinetyDaysChallengeRecord.collection,
        NinetyDaysChallengeRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query VisionBoardAchievementRecords (as a Stream and as a Future).
Stream<List<VisionBoardAchievementRecord>> queryVisionBoardAchievementRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(VisionBoardAchievementRecord.collection,
        VisionBoardAchievementRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<VisionBoardAchievementRecord>>
    queryVisionBoardAchievementRecordOnce(
            {Query Function(Query) queryBuilder,
            int limit = -1,
            bool singleRecord = false}) =>
        queryCollectionOnce(VisionBoardAchievementRecord.collection,
            VisionBoardAchievementRecord.serializer,
            queryBuilder: queryBuilder,
            limit: limit,
            singleRecord: singleRecord);

/// Functions to query VisionBoardRecords (as a Stream and as a Future).
Stream<List<VisionBoardRecord>> queryVisionBoardRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(VisionBoardRecord.collection, VisionBoardRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<VisionBoardRecord>> queryVisionBoardRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        VisionBoardRecord.collection, VisionBoardRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query BooksRecords (as a Stream and as a Future).
Stream<List<BooksRecord>> queryBooksRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(BooksRecord.collection, BooksRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<BooksRecord>> queryBooksRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(BooksRecord.collection, BooksRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query DailyExpenseTrackerRecords (as a Stream and as a Future).
Stream<List<DailyExpenseTrackerRecord>> queryDailyExpenseTrackerRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(DailyExpenseTrackerRecord.collection,
        DailyExpenseTrackerRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<DailyExpenseTrackerRecord>> queryDailyExpenseTrackerRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(DailyExpenseTrackerRecord.collection,
        DailyExpenseTrackerRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query TwentyOneDaysCounterRecords (as a Stream and as a Future).
Stream<List<TwentyOneDaysCounterRecord>> queryTwentyOneDaysCounterRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(TwentyOneDaysCounterRecord.collection,
        TwentyOneDaysCounterRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<TwentyOneDaysCounterRecord>> queryTwentyOneDaysCounterRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(TwentyOneDaysCounterRecord.collection,
        TwentyOneDaysCounterRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query Task21Records (as a Stream and as a Future).
Stream<List<Task21Record>> queryTask21Record(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(Task21Record.collection, Task21Record.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<Task21Record>> queryTask21RecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(Task21Record.collection, Task21Record.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query QuarterlyGoalsRecords (as a Stream and as a Future).
Stream<List<QuarterlyGoalsRecord>> queryQuarterlyGoalsRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        QuarterlyGoalsRecord.collection, QuarterlyGoalsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<QuarterlyGoalsRecord>> queryQuarterlyGoalsRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        QuarterlyGoalsRecord.collection, QuarterlyGoalsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query DailySuccessPlannerRecords (as a Stream and as a Future).
Stream<List<DailySuccessPlannerRecord>> queryDailySuccessPlannerRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(DailySuccessPlannerRecord.collection,
        DailySuccessPlannerRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<DailySuccessPlannerRecord>> queryDailySuccessPlannerRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(DailySuccessPlannerRecord.collection,
        DailySuccessPlannerRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query TargetsRecords (as a Stream and as a Future).
Stream<List<TargetsRecord>> queryTargetsRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(TargetsRecord.collection, TargetsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<TargetsRecord>> queryTargetsRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(TargetsRecord.collection, TargetsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query Task90Records (as a Stream and as a Future).
Stream<List<Task90Record>> queryTask90Record(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(Task90Record.collection, Task90Record.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<Task90Record>> queryTask90RecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(Task90Record.collection, Task90Record.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query NinetyDaysCounterRecords (as a Stream and as a Future).
Stream<List<NinetyDaysCounterRecord>> queryNinetyDaysCounterRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        NinetyDaysCounterRecord.collection, NinetyDaysCounterRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<NinetyDaysCounterRecord>> queryNinetyDaysCounterRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        NinetyDaysCounterRecord.collection, NinetyDaysCounterRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query VideoCoursesRecords (as a Stream and as a Future).
Stream<List<VideoCoursesRecord>> queryVideoCoursesRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        VideoCoursesRecord.collection, VideoCoursesRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<VideoCoursesRecord>> queryVideoCoursesRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        VideoCoursesRecord.collection, VideoCoursesRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Stream<List<T>> queryCollection<T>(
    CollectionReference collection, Serializer<T> serializer,
    {Query Function(Query) queryBuilder,
    int limit = -1,
    bool singleRecord = false}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.snapshots().map((s) => s.docs
      .map(
        (d) => safeGet(
          () => serializers.deserializeWith(serializer, serializedData(d)),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .toList());
}

Future<List<T>> queryCollectionOnce<T>(
    CollectionReference collection, Serializer<T> serializer,
    {Query Function(Query) queryBuilder,
    int limit = -1,
    bool singleRecord = false}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.get().then((s) => s.docs
      .map(
        (d) => safeGet(
          () => serializers.deserializeWith(serializer, serializedData(d)),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .toList());
}

// Creates a Firestore record representing the logged in user if it doesn't yet exist
Future maybeCreateUser(User user) async {
  final userRecord = UsersRecord.collection.doc(user.uid);
  final userExists = await userRecord.get().then((u) => u.exists);
  if (userExists) {
    return;
  }

  final userData = createUsersRecordData(
    email: user.email,
    displayName: user.displayName,
    photoUrl: user.photoURL,
    uid: user.uid,
    phoneNumber: user.phoneNumber,
    createdTime: getCurrentTimestamp,
  );

  await userRecord.set(userData);
}
