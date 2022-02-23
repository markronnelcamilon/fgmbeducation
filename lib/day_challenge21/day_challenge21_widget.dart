import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/challenge_component_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class DayChallenge21Widget extends StatefulWidget {
  const DayChallenge21Widget({
    Key key,
    this.taskScreen,
    this.counter,
  }) : super(key: key);

  final DocumentReference taskScreen;
  final int counter;

  @override
  _DayChallenge21WidgetState createState() => _DayChallenge21WidgetState();
}

class _DayChallenge21WidgetState extends State<DayChallenge21Widget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NavBarPage(initialPage: 'HomePage'),
              ),
            );
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: Colors.white,
            size: 32,
          ),
        ),
        title: Text(
          '21 Day Challenge',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Lexend Deca',
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
          child: StreamBuilder<List<TwentyOneDaysCounterRecord>>(
            stream: queryTwentyOneDaysCounterRecord(
              queryBuilder: (twentyOneDaysCounterRecord) =>
                  twentyOneDaysCounterRecord.where('uid',
                      isEqualTo: currentUserUid),
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
              List<TwentyOneDaysCounterRecord>
                  columnTwentyOneDaysCounterRecordList = snapshot.data;
              // Return an empty Container when the document does not exist.
              if (snapshot.data.isEmpty) {
                return Container();
              }
              final columnTwentyOneDaysCounterRecord =
                  columnTwentyOneDaysCounterRecordList.isNotEmpty
                      ? columnTwentyOneDaysCounterRecordList.first
                      : null;
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset(
                    'assets/images/fgmblogo.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  Expanded(
                    child: StreamBuilder<List<TwentyOneDaysChallengeRecord>>(
                      stream: queryTwentyOneDaysChallengeRecord(
                        queryBuilder: (twentyOneDaysChallengeRecord) =>
                            twentyOneDaysChallengeRecord
                                .where('uid', isEqualTo: currentUserUid)
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
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 50,
                              ),
                            ),
                          );
                        }
                        List<TwentyOneDaysChallengeRecord>
                            gridViewTwentyOneDaysChallengeRecordList =
                            snapshot.data;
                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 7,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1,
                          ),
                          scrollDirection: Axis.vertical,
                          itemCount:
                              gridViewTwentyOneDaysChallengeRecordList.length,
                          itemBuilder: (context, gridViewIndex) {
                            final gridViewTwentyOneDaysChallengeRecord =
                                gridViewTwentyOneDaysChallengeRecordList[
                                    gridViewIndex];
                            return InkWell(
                              onTap: () async {
                                if (!(gridViewTwentyOneDaysChallengeRecord
                                    .completed)) {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.7,
                                          child: ChallengeComponentWidget(
                                            challengeComponentUID:
                                                gridViewTwentyOneDaysChallengeRecord
                                                    .uid,
                                            challengeComponentDay:
                                                gridViewTwentyOneDaysChallengeRecord
                                                    .day,
                                            challengeComponentDate:
                                                gridViewTwentyOneDaysChallengeRecord
                                                    .date,
                                            challengeComponentRR:
                                                gridViewTwentyOneDaysChallengeRecord
                                                    .reference,
                                            challengeComponentTask5: false,
                                            challengeComplete:
                                                gridViewTwentyOneDaysChallengeRecord,
                                            counterReference:
                                                columnTwentyOneDaysCounterRecord
                                                    .reference,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                                if (gridViewTwentyOneDaysChallengeRecord
                                    .completed) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Task already completed'),
                                        content: Text(
                                            'The task is already completed you can proceed to next task'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                              child: Container(
                                width: 200,
                                height: 200,
                                constraints: BoxConstraints(
                                  maxWidth: 200,
                                  maxHeight: 200,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                ),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if ((gridViewTwentyOneDaysChallengeRecord
                                              .completed) ==
                                          false)
                                        Icon(
                                          Icons.lock,
                                          color: Color(0xFF121212),
                                          size: 24,
                                        ),
                                      if ((gridViewTwentyOneDaysChallengeRecord
                                              .completed) ==
                                          true)
                                        Text(
                                          gridViewTwentyOneDaysChallengeRecord
                                              .label
                                              .toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                        ),
                                      if ((gridViewTwentyOneDaysChallengeRecord
                                              .completed) ==
                                          true)
                                        Icon(
                                          Icons.check,
                                          color: Color(0xFF146B3A),
                                          size: 24,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Color(0xFFF5F5F5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/Untitled_design_(4).png',
                            width: 40,
                            height: 40,
                            fit: BoxFit.fitWidth,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                            child: Text(
                              'Create IG Story Post',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
