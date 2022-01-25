import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DayChallenge90Widget extends StatefulWidget {
  const DayChallenge90Widget({Key key}) : super(key: key);

  @override
  _DayChallenge90WidgetState createState() => _DayChallenge90WidgetState();
}

class _DayChallenge90WidgetState extends State<DayChallenge90Widget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<NinetyDaysChallengeRecord>>(
      stream: queryNinetyDaysChallengeRecord(
        queryBuilder: (ninetyDaysChallengeRecord) => ninetyDaysChallengeRecord
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
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.primaryColor,
              ),
            ),
          );
        }
        List<NinetyDaysChallengeRecord>
            dayChallenge90NinetyDaysChallengeRecordList = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.primaryColor,
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        NavBarPage(initialPage: 'SubscirptionPage'),
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
              '90 Day Challenge',
              style: FlutterFlowTheme.title2.override(
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset(
                    'assets/images/fgmblogo.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  Expanded(
                    child: StreamBuilder<List<NinetyDaysChallengeRecord>>(
                      stream: queryNinetyDaysChallengeRecord(
                        queryBuilder: (ninetyDaysChallengeRecord) =>
                            ninetyDaysChallengeRecord
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
                              child: CircularProgressIndicator(
                                color: FlutterFlowTheme.primaryColor,
                              ),
                            ),
                          );
                        }
                        List<NinetyDaysChallengeRecord>
                            gridViewNinetyDaysChallengeRecordList =
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
                              gridViewNinetyDaysChallengeRecordList.length,
                          itemBuilder: (context, gridViewIndex) {
                            final gridViewNinetyDaysChallengeRecord =
                                gridViewNinetyDaysChallengeRecordList[
                                    gridViewIndex];
                            return Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFCFB53B),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if ((gridViewNinetyDaysChallengeRecord
                                          .completed) ==
                                      true)
                                    Text(
                                      gridViewNinetyDaysChallengeRecord.label
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.tertiaryColor,
                                      ),
                                    ),
                                  if ((gridViewNinetyDaysChallengeRecord
                                          .completed) ==
                                      false)
                                    Icon(
                                      Icons.lock,
                                      color: Color(0xFF121212),
                                      size: 24,
                                    ),
                                ],
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
                              style: FlutterFlowTheme.bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
