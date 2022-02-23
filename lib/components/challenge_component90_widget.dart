import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ChallengeComponent90Widget extends StatefulWidget {
  const ChallengeComponent90Widget({
    Key key,
    this.challengeComponent90UID,
    this.challengeComponent90Day,
    this.challengeComponent90Date,
    this.challengeComponent90RR,
    this.challengeComponent90Task5,
    this.challengeComplete90,
  }) : super(key: key);

  final String challengeComponent90UID;
  final String challengeComponent90Day;
  final DateTime challengeComponent90Date;
  final DocumentReference challengeComponent90RR;
  final bool challengeComponent90Task5;
  final DocumentReference challengeComplete90;

  @override
  _ChallengeComponent90WidgetState createState() =>
      _ChallengeComponent90WidgetState();
}

class _ChallengeComponent90WidgetState
    extends State<ChallengeComponent90Widget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8, 16, 8, 8),
      child: StreamBuilder<List<NinetyDaysChallengeRecord>>(
        stream: queryNinetyDaysChallengeRecord(
          singleRecord: true,
        ),
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
          List<NinetyDaysChallengeRecord> columnNinetyDaysChallengeRecordList =
              snapshot.data;
          // Return an empty Container when the document does not exist.
          if (snapshot.data.isEmpty) {
            return Container();
          }
          final columnNinetyDaysChallengeRecord =
              columnNinetyDaysChallengeRecordList.isNotEmpty
                  ? columnNinetyDaysChallengeRecordList.first
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
                        dateTimeFormat(
                            'yMMMd', widget.challengeComponent90Date),
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                      Text(
                        widget.challengeComponent90Day,
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ],
                  ),
                ),
                StreamBuilder<List<Task90Record>>(
                  stream: queryTask90Record(
                    queryBuilder: (task90Record) => task90Record
                        .where('uid', isEqualTo: currentUserUid)
                        .where('day',
                            isEqualTo: columnNinetyDaysChallengeRecord.day)
                        .orderBy('label'),
                  ),
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
                    List<Task90Record> columnTask90RecordList = snapshot.data;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(columnTask90RecordList.length,
                          (columnIndex) {
                        final columnTask90Record =
                            columnTask90RecordList[columnIndex];
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ToggleIcon(
                                    onPressed: () async {
                                      final task90UpdateData =
                                          createTask90RecordData(
                                        taskState:
                                            !columnTask90Record.taskState,
                                      );
                                      await columnTask90Record.reference
                                          .update(task90UpdateData);
                                    },
                                    value: columnTask90Record.taskState,
                                    onIcon: Icon(
                                      Icons.check_box,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 25,
                                    ),
                                    offIcon: Icon(
                                      Icons.check_box_outline_blank,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      size: 25,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        6, 0, 0, 0),
                                    child: Text(
                                      columnTask90Record.taskName,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
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
                StreamBuilder<List<Task90Record>>(
                  stream: queryTask90Record(
                    singleRecord: true,
                  ),
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
                    List<Task90Record> columnTask90RecordList = snapshot.data;
                    // Return an empty Container when the document does not exist.
                    if (snapshot.data.isEmpty) {
                      return Container();
                    }
                    final columnTask90Record = columnTask90RecordList.isNotEmpty
                        ? columnTask90RecordList.first
                        : null;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                            final ninetyDaysChallengeUpdateData =
                                createNinetyDaysChallengeRecordData(
                              completed: true,
                            );
                            await columnNinetyDaysChallengeRecord.reference
                                .update(ninetyDaysChallengeUpdateData);
                          },
                          text: 'Complete',
                          icon: Icon(
                            Icons.fact_check,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 200,
                            height: 40,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
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
                          color: FlutterFlowTheme.of(context).tertiaryColor,
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
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                child: Text(
                                  'Make notes of any changes, insights or breakthroughs you achieve.',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context).bodyText1,
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
