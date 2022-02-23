import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../daily_success_planner_page/daily_success_planner_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DailySuccessPlannerListWidget extends StatefulWidget {
  const DailySuccessPlannerListWidget({Key key}) : super(key: key);

  @override
  _DailySuccessPlannerListWidgetState createState() =>
      _DailySuccessPlannerListWidgetState();
}

class _DailySuccessPlannerListWidgetState
    extends State<DailySuccessPlannerListWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'Daily Success Planner',
          style: FlutterFlowTheme.of(context).title3.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).tertiaryColor,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: StreamBuilder<List<DailySuccessPlannerRecord>>(
                  stream: queryDailySuccessPlannerRecord(
                    queryBuilder: (dailySuccessPlannerRecord) =>
                        dailySuccessPlannerRecord
                            .where('uid', isEqualTo: currentUserUid)
                            .orderBy('date')
                            .orderBy('did_win_the_day'),
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
                    List<DailySuccessPlannerRecord>
                        listViewDailySuccessPlannerRecordList = snapshot.data;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewDailySuccessPlannerRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewDailySuccessPlannerRecord =
                            listViewDailySuccessPlannerRecordList[
                                listViewIndex];
                        return Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 2, 16, 2),
                            child: InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DailySuccessPlannerPageWidget(
                                      dailySuccessPlannerRR:
                                          listViewDailySuccessPlannerRecord
                                              .reference,
                                    ),
                                  ),
                                );
                              },
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Color(0xFFF5F5F5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 16, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              dateTimeFormat(
                                                  'yMMMd',
                                                  listViewDailySuccessPlannerRecord
                                                      .date),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                      ),
                                            ),
                                            Text(
                                              listViewDailySuccessPlannerRecord
                                                  .gratefulFor,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if ((listViewDailySuccessPlannerRecord
                                              .didWinTheDay) ==
                                          true)
                                        FaIcon(
                                          FontAwesomeIcons.medal,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 24,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
