import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/daily_affirmation_bs_widget.dart';
import '../components/grateful_for_bs_widget.dart';
import '../components/ithankgodfor_bs_widget.dart';
import '../components/quarterly_bs_widget.dart';
import '../components/target_details1_widget.dart';
import '../components/target_details2_widget.dart';
import '../components/target_details3_widget.dart';
import '../components/target_details4_widget.dart';
import '../components/target_details5_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class DailySuccessPlannerPageWidget extends StatefulWidget {
  const DailySuccessPlannerPageWidget({
    Key key,
    this.dailySuccessPlannerRR,
  }) : super(key: key);

  final DocumentReference dailySuccessPlannerRR;

  @override
  _DailySuccessPlannerPageWidgetState createState() =>
      _DailySuccessPlannerPageWidgetState();
}

class _DailySuccessPlannerPageWidgetState
    extends State<DailySuccessPlannerPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DailySuccessPlannerRecord>(
      stream:
          DailySuccessPlannerRecord.getDocument(widget.dailySuccessPlannerRR),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitDoubleBounce(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 50,
              ),
            ),
          );
        }
        final dailySuccessPlannerPageDailySuccessPlannerRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: true,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.chevron_left,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        NavBarPage(initialPage: 'SubscirptionPage'),
                  ),
                );
              },
            ),
            title: Text(
              'Daily Success Planner',
              style: FlutterFlowTheme.of(context).title1.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 4,
          ),
          backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              dateTimeFormat(
                                  'yMMMd',
                                  dailySuccessPlannerPageDailySuccessPlannerRecord
                                      .date),
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ToggleIcon(
                              onPressed: () async {
                                final dailySuccessPlannerUpdateData =
                                    createDailySuccessPlannerRecordData(
                                  writeDownGoals:
                                      !dailySuccessPlannerPageDailySuccessPlannerRecord
                                          .writeDownGoals,
                                );
                                await dailySuccessPlannerPageDailySuccessPlannerRecord
                                    .reference
                                    .update(dailySuccessPlannerUpdateData);
                              },
                              value:
                                  dailySuccessPlannerPageDailySuccessPlannerRecord
                                      .writeDownGoals,
                              onIcon: Icon(
                                Icons.check_box,
                                color: Colors.black,
                                size: 20,
                              ),
                              offIcon: Icon(
                                Icons.check_box_outline_blank,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: Text(
                                'Do you write down your goals?',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ToggleIcon(
                              onPressed: () async {
                                final dailySuccessPlannerUpdateData =
                                    createDailySuccessPlannerRecordData(
                                  readTenPages:
                                      !dailySuccessPlannerPageDailySuccessPlannerRecord
                                          .readTenPages,
                                );
                                await dailySuccessPlannerPageDailySuccessPlannerRecord
                                    .reference
                                    .update(dailySuccessPlannerUpdateData);
                              },
                              value:
                                  dailySuccessPlannerPageDailySuccessPlannerRecord
                                      .readTenPages,
                              onIcon: Icon(
                                Icons.check_box,
                                color: Colors.black,
                                size: 20,
                              ),
                              offIcon: Icon(
                                Icons.check_box_outline_blank,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: Text(
                                'Did you read 10 pages of a book today?',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      StreamBuilder<List<QuarterlyGoalsRecord>>(
                        stream: queryQuarterlyGoalsRecord(
                          queryBuilder: (quarterlyGoalsRecord) =>
                              quarterlyGoalsRecord
                                  .where('uid', isEqualTo: currentUserUid)
                                  .orderBy('quarter'),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: SpinKitDoubleBounce(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 50,
                                ),
                              ),
                            );
                          }
                          List<QuarterlyGoalsRecord>
                              rowQuarterlyGoalsRecordList = snapshot.data;
                          if (rowQuarterlyGoalsRecordList.isEmpty) {
                            return Center(
                              child: Image.asset(
                                'assets/images/Untitled_design_(6).png',
                              ),
                            );
                          }
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                  rowQuarterlyGoalsRecordList.length,
                                  (rowIndex) {
                                final rowQuarterlyGoalsRecord =
                                    rowQuarterlyGoalsRecordList[rowIndex];
                                return InkWell(
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: QuarterlyBsWidget(
                                            quarterlyGoalReference:
                                                rowQuarterlyGoalsRecord
                                                    .reference,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.23,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                    ),
                                    child: InkWell(
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: QuarterlyBsWidget(
                                                quarterlyGoalReference:
                                                    rowQuarterlyGoalsRecord
                                                        .reference,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: Color(0xFF388E3C),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 10, 10, 10),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                rowQuarterlyGoalsRecord.label,
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiaryColor,
                                                          fontSize: 8,
                                                        ),
                                              ),
                                              Text(
                                                rowQuarterlyGoalsRecord.goals,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiaryColor,
                                                          fontSize: 10,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          );
                        },
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                        ),
                        child: InkWell(
                          onTap: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: GratefulForBsWidget(
                                    gratefulReference:
                                        dailySuccessPlannerPageDailySuccessPlannerRecord
                                            .reference,
                                  ),
                                );
                              },
                            );
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFF009688),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'GRATEFUL FOR',
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                          fontSize: 14,
                                        ),
                                  ),
                                  Text(
                                    dailySuccessPlannerPageDailySuccessPlannerRecord
                                        .gratefulFor,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: Text(
                          'TARGETS: Targets are designed to get you closer to achieving your goals',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyText2
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: TargetDetails1Widget(
                                      targetDetail1:
                                          dailySuccessPlannerPageDailySuccessPlannerRecord,
                                    ),
                                  );
                                },
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ToggleIcon(
                                  onPressed: () async {
                                    final dailySuccessPlannerUpdateData =
                                        createDailySuccessPlannerRecordData(
                                      task01:
                                          !dailySuccessPlannerPageDailySuccessPlannerRecord
                                              .task01,
                                    );
                                    await dailySuccessPlannerPageDailySuccessPlannerRecord
                                        .reference
                                        .update(dailySuccessPlannerUpdateData);
                                  },
                                  value:
                                      dailySuccessPlannerPageDailySuccessPlannerRecord
                                          .task01,
                                  onIcon: Icon(
                                    Icons.check_box,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                  offIcon: Icon(
                                    Icons.check_box_outline_blank,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                ),
                                Text(
                                  dailySuccessPlannerPageDailySuccessPlannerRecord
                                      .targetDetail01,
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: TargetDetails2Widget(
                                      targetDetail2:
                                          dailySuccessPlannerPageDailySuccessPlannerRecord,
                                    ),
                                  );
                                },
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ToggleIcon(
                                  onPressed: () async {
                                    final dailySuccessPlannerUpdateData =
                                        createDailySuccessPlannerRecordData(
                                      task02:
                                          !dailySuccessPlannerPageDailySuccessPlannerRecord
                                              .task02,
                                    );
                                    await dailySuccessPlannerPageDailySuccessPlannerRecord
                                        .reference
                                        .update(dailySuccessPlannerUpdateData);
                                  },
                                  value:
                                      dailySuccessPlannerPageDailySuccessPlannerRecord
                                          .task02,
                                  onIcon: Icon(
                                    Icons.check_box,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                  offIcon: Icon(
                                    Icons.check_box_outline_blank,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                ),
                                Text(
                                  dailySuccessPlannerPageDailySuccessPlannerRecord
                                      .targetDetail02,
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: TargetDetails3Widget(
                                      targetDetail3:
                                          dailySuccessPlannerPageDailySuccessPlannerRecord,
                                    ),
                                  );
                                },
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ToggleIcon(
                                  onPressed: () async {
                                    final dailySuccessPlannerUpdateData =
                                        createDailySuccessPlannerRecordData(
                                      task03:
                                          !dailySuccessPlannerPageDailySuccessPlannerRecord
                                              .task03,
                                    );
                                    await dailySuccessPlannerPageDailySuccessPlannerRecord
                                        .reference
                                        .update(dailySuccessPlannerUpdateData);
                                  },
                                  value:
                                      dailySuccessPlannerPageDailySuccessPlannerRecord
                                          .task03,
                                  onIcon: Icon(
                                    Icons.check_box,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                  offIcon: Icon(
                                    Icons.check_box_outline_blank,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                ),
                                Text(
                                  dailySuccessPlannerPageDailySuccessPlannerRecord
                                      .targetDetail03,
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: TargetDetails4Widget(
                                      targetDetail4:
                                          dailySuccessPlannerPageDailySuccessPlannerRecord,
                                    ),
                                  );
                                },
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ToggleIcon(
                                  onPressed: () async {
                                    final dailySuccessPlannerUpdateData =
                                        createDailySuccessPlannerRecordData(
                                      task04:
                                          !dailySuccessPlannerPageDailySuccessPlannerRecord
                                              .task04,
                                    );
                                    await dailySuccessPlannerPageDailySuccessPlannerRecord
                                        .reference
                                        .update(dailySuccessPlannerUpdateData);
                                  },
                                  value:
                                      dailySuccessPlannerPageDailySuccessPlannerRecord
                                          .task04,
                                  onIcon: Icon(
                                    Icons.check_box,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                  offIcon: Icon(
                                    Icons.check_box_outline_blank,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                ),
                                Text(
                                  dailySuccessPlannerPageDailySuccessPlannerRecord
                                      .targetDetail04,
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: TargetDetails5Widget(
                                      targetDetail5:
                                          dailySuccessPlannerPageDailySuccessPlannerRecord,
                                    ),
                                  );
                                },
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ToggleIcon(
                                  onPressed: () async {
                                    final dailySuccessPlannerUpdateData =
                                        createDailySuccessPlannerRecordData(
                                      task05:
                                          !dailySuccessPlannerPageDailySuccessPlannerRecord
                                              .task05,
                                    );
                                    await dailySuccessPlannerPageDailySuccessPlannerRecord
                                        .reference
                                        .update(dailySuccessPlannerUpdateData);
                                  },
                                  value:
                                      dailySuccessPlannerPageDailySuccessPlannerRecord
                                          .task05,
                                  onIcon: Icon(
                                    Icons.check_box,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                  offIcon: Icon(
                                    Icons.check_box_outline_blank,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                ),
                                Text(
                                  dailySuccessPlannerPageDailySuccessPlannerRecord
                                      .targetDetail05,
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: Text(
                          'TODAYS PLAN',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyText2
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                        ),
                        child: InkWell(
                          onTap: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: IthankgodforBsWidget(
                                    gratefulReference:
                                        dailySuccessPlannerPageDailySuccessPlannerRecord
                                            .reference,
                                  ),
                                );
                              },
                            );
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFFFC5252),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'I THANK GOD FOR',
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                          fontSize: 14,
                                        ),
                                  ),
                                  Text(
                                    dailySuccessPlannerPageDailySuccessPlannerRecord
                                        .iThankGodFor,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                        ),
                        child: InkWell(
                          onTap: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: DailyAffirmationBsWidget(
                                    gratefulReference:
                                        dailySuccessPlannerPageDailySuccessPlannerRecord
                                            .reference,
                                  ),
                                );
                              },
                            );
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFFFFC107),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'DAILY AFFIRMATION',
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                          fontSize: 14,
                                        ),
                                  ),
                                  Text(
                                    dailySuccessPlannerPageDailySuccessPlannerRecord
                                        .gratefulFor,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                        ),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Color(0xFF00695C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'DID YOU WIN THE DAY?',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    ToggleIcon(
                                      onPressed: () async {
                                        final dailySuccessPlannerUpdateData =
                                            createDailySuccessPlannerRecordData(
                                          didWinTheDay:
                                              !dailySuccessPlannerPageDailySuccessPlannerRecord
                                                  .didWinTheDay,
                                        );
                                        await dailySuccessPlannerPageDailySuccessPlannerRecord
                                            .reference
                                            .update(
                                                dailySuccessPlannerUpdateData);
                                      },
                                      value:
                                          dailySuccessPlannerPageDailySuccessPlannerRecord
                                              .didWinTheDay,
                                      onIcon: Icon(
                                        Icons.check_box,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        size: 20,
                                      ),
                                      offIcon: Icon(
                                        Icons.check_box_outline_blank,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        size: 25,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Answer yes only if you  1. Write down your goal 2. Rewrote your quarterly goal  3. Completed all your targets',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFFF5F5F5),
                                        fontSize: 8,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
