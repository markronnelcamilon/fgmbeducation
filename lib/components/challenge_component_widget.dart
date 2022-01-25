import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChallengeComponentWidget extends StatefulWidget {
  const ChallengeComponentWidget({
    Key key,
    this.challengeComponentUID,
    this.challengeComponentDay,
    this.challengeComponentDate,
    this.challengeComponentRR,
    this.challengeComponentTask5,
    this.challengeComplete,
  }) : super(key: key);

  final String challengeComponentUID;
  final String challengeComponentDay;
  final DateTime challengeComponentDate;
  final DocumentReference challengeComponentRR;
  final bool challengeComponentTask5;
  final TwentyOneDaysChallengeRecord challengeComplete;

  @override
  _ChallengeComponentWidgetState createState() =>
      _ChallengeComponentWidgetState();
}

class _ChallengeComponentWidgetState extends State<ChallengeComponentWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8, 16, 8, 8),
      child: StreamBuilder<List<TwentyOneDaysChallengeRecord>>(
        stream: queryTwentyOneDaysChallengeRecord(
          singleRecord: true,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  color: FlutterFlowTheme.primaryColor,
                ),
              ),
            );
          }
          List<TwentyOneDaysChallengeRecord>
              columnTwentyOneDaysChallengeRecordList = snapshot.data;
          // Return an empty Container when the document does not exist.
          if (snapshot.data.isEmpty) {
            return Container();
          }
          final columnTwentyOneDaysChallengeRecord =
              columnTwentyOneDaysChallengeRecordList.isNotEmpty
                  ? columnTwentyOneDaysChallengeRecordList.first
                  : null;
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 16, 8, 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        dateTimeFormat('yMMMd', widget.challengeComponentDate),
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.title3,
                      ),
                      Text(
                        widget.challengeComponentDay,
                        style: FlutterFlowTheme.title3,
                      ),
                    ],
                  ),
                ),
                StreamBuilder<List<Task21Record>>(
                  stream: queryTask21Record(
                    queryBuilder: (task21Record) => task21Record
                        .where('uid', isEqualTo: currentUserUid)
                        .where('day',
                            isEqualTo: columnTwentyOneDaysChallengeRecord.day)
                        .orderBy('label'),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.primaryColor,
                          ),
                        ),
                      );
                    }
                    List<Task21Record> columnTask21RecordList = snapshot.data;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(columnTask21RecordList.length,
                          (columnIndex) {
                        final columnTask21Record =
                            columnTask21RecordList[columnIndex];
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.tertiaryColor,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ToggleIcon(
                                    onPressed: () async {
                                      final task21UpdateData =
                                          createTask21RecordData(
                                        taskState:
                                            !columnTask21Record.taskState,
                                      );
                                      await columnTask21Record.reference
                                          .update(task21UpdateData);
                                    },
                                    value: columnTask21Record.taskState,
                                    onIcon: Icon(
                                      Icons.check_box,
                                      color: FlutterFlowTheme.primaryColor,
                                      size: 25,
                                    ),
                                    offIcon: Icon(
                                      Icons.check_box_outline_blank,
                                      color: FlutterFlowTheme.secondaryColor,
                                      size: 25,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        6, 0, 0, 0),
                                    child: Text(
                                      columnTask21Record.taskName,
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                    );
                  },
                ),
                StreamBuilder<List<Task21Record>>(
                  stream: queryTask21Record(
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.primaryColor,
                          ),
                        ),
                      );
                    }
                    List<Task21Record> columnTask21RecordList = snapshot.data;
                    // Return an empty Container when the document does not exist.
                    if (snapshot.data.isEmpty) {
                      return Container();
                    }
                    final columnTask21Record = columnTask21RecordList.isNotEmpty
                        ? columnTask21RecordList.first
                        : null;
                    return InkWell(
                      onTap: () async {
                        final twentyOneDaysChallengeUpdateData =
                            createTwentyOneDaysChallengeRecordData(
                          completed: true,
                        );
                        await columnTwentyOneDaysChallengeRecord.reference
                            .update(twentyOneDaysChallengeUpdateData);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              final twentyOneDaysChallengeUpdateData =
                                  createTwentyOneDaysChallengeRecordData(
                                completed: true,
                              );
                              await widget.challengeComplete.reference
                                  .update(twentyOneDaysChallengeUpdateData);

                              final twentyOneDaysCounterUpdateData = {
                                'no_of_days': FieldValue.increment(1),
                              };
                              await columnTwentyOneDaysChallengeRecord.counter
                                  .update(twentyOneDaysCounterUpdateData);
                              Navigator.pop(context);
                            },
                            text: 'Complete',
                            icon: Icon(
                              Icons.fact_check,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              width: 200,
                              height: 40,
                              color: FlutterFlowTheme.primaryColor,
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                        ),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: FlutterFlowTheme.tertiaryColor,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Notes',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.primaryColor,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                child: Text(
                                  'Make notes of any changes, insights or breakthroughs you achieve.',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.bodyText1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
