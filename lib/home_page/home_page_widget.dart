import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../daily_success_planner_list/daily_success_planner_list_widget.dart';
import '../day_challenge21/day_challenge21_widget.dart';
import '../day_challenge90/day_challenge90_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../goal_book/goal_book_widget.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF4B39EF),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'BRAG',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 0,
                        borderWidth: 1,
                        buttonSize: 50,
                        icon: FaIcon(
                          FontAwesomeIcons.shareAltSquare,
                          color: Color(0xFFCFB53B),
                          size: 30,
                        ),
                        onPressed: () async {
                          await Share.share('');
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: AuthUserStreamWidget(
                        child: Container(
                          width: 120,
                          height: 120,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            currentUserPhoto,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/images/fgmblogo.png',
                      width: 150,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: FlutterFlowTheme.of(context).tertiaryColor,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 50,
                                ),
                              ),
                            );
                          }
                          List<TwentyOneDaysCounterRecord>
                              columnTwentyOneDaysCounterRecordList =
                              snapshot.data;
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                child: Text(
                                  'Current Contest | Leaderboard',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 8, 8, 8),
                                      child: custom_widgets.ProgressIndicator(
                                        width: 70,
                                        height: 70,
                                        noOfDays:
                                            columnTwentyOneDaysCounterRecord
                                                .noOfDays,
                                      ),
                                    ),
                                    StreamBuilder<
                                        List<TwentyOneDaysCounterRecord>>(
                                      stream: queryTwentyOneDaysCounterRecord(
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 50,
                                              ),
                                            ),
                                          );
                                        }
                                        List<TwentyOneDaysCounterRecord>
                                            containerTwentyOneDaysCounterRecordList =
                                            snapshot.data;
                                        // Return an empty Container when the document does not exist.
                                        if (snapshot.data.isEmpty) {
                                          return Container();
                                        }
                                        final containerTwentyOneDaysCounterRecord =
                                            containerTwentyOneDaysCounterRecordList
                                                    .isNotEmpty
                                                ? containerTwentyOneDaysCounterRecordList
                                                    .first
                                                : null;
                                        return Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 100,
                                          constraints: BoxConstraints(
                                            maxWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    containerTwentyOneDaysCounterRecord
                                                        .noOfDays
                                                        .toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 16,
                                                        ),
                                                  ),
                                                  Text(
                                                    '/21 Days Challenge',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 16,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    dateTimeFormat(
                                                        'yMMMd',
                                                        containerTwentyOneDaysCounterRecord
                                                            .startDate),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                  Text(
                                                    '-',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                  Text(
                                                    dateTimeFormat(
                                                        'yMMMd',
                                                        containerTwentyOneDaysCounterRecord
                                                            .endDate),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: FlutterFlowTheme.of(context).tertiaryColor,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                            child: Text(
                              'Subscription',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 100,
                                    constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.of(context).size.width,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .tertiaryColor,
                                    ),
                                    child:
                                        StreamBuilder<List<SubscriptionRecord>>(
                                      stream: querySubscriptionRecord(
                                        queryBuilder: (subscriptionRecord) =>
                                            subscriptionRecord.where('uid',
                                                isEqualTo: currentUserUid),
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
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 50,
                                              ),
                                            ),
                                          );
                                        }
                                        List<SubscriptionRecord>
                                            listViewSubscriptionRecordList =
                                            snapshot.data;
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              listViewSubscriptionRecordList
                                                  .length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewSubscriptionRecord =
                                                listViewSubscriptionRecordList[
                                                    listViewIndex];
                                            return Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(2, 2, 2, 2),
                                                child: InkWell(
                                                  onTap: () async {
                                                    if ((listViewSubscriptionRecord
                                                            .subscriptionName) ==
                                                        '21 Day Challenge') {
                                                      await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              DayChallenge21Widget(),
                                                        ),
                                                      );
                                                    }
                                                    if ((listViewSubscriptionRecord
                                                            .subscriptionName) ==
                                                        'Daily Goal Book') {
                                                      await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              GoalBookWidget(),
                                                        ),
                                                      );
                                                    }
                                                    if ((listViewSubscriptionRecord
                                                            .subscriptionName) ==
                                                        'Daily Success Planner') {
                                                      await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              DailySuccessPlannerListWidget(),
                                                        ),
                                                      );
                                                    }
                                                    if ((listViewSubscriptionRecord
                                                            .subscriptionName) ==
                                                        '90 Day Challenge') {
                                                      await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              DayChallenge90Widget(),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                  child: Card(
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(5,
                                                                      5, 5, 5),
                                                          child: Text(
                                                            listViewSubscriptionRecord
                                                                .subscriptionName,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                                  fontSize: 12,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
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
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Text(
                    'fgmhub.com',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 10, 8, 50),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Share 21 Day Challenge with a friend',
                    options: FFButtonOptions(
                      width: double.infinity,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
