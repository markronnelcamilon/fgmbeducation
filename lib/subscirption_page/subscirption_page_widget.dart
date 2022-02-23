import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/daily_success_planner_widget.dart';
import '../components/financial_planner_widget.dart';
import '../components/subscribe21_days_widget.dart';
import '../components/subscribe90_days_widget.dart';
import '../day_challenge21/day_challenge21_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../goal_book/goal_book_widget.dart';
import '../vision_board/vision_board_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SubscirptionPageWidget extends StatefulWidget {
  const SubscirptionPageWidget({Key key}) : super(key: key);

  @override
  _SubscirptionPageWidgetState createState() => _SubscirptionPageWidgetState();
}

class _SubscirptionPageWidgetState extends State<SubscirptionPageWidget> {
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
          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/fgmblogo.png',
                        width: 150,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VisionBoardWidget(),
                        ),
                      );
                    },
                    text: 'Vision Board Free',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 60,
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 5),
                  child: Text(
                    'MILLIONAIRES SUCCESS HABITS CHALLENGE',
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 2, 2, 2),
                  child: InkWell(
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: Subscribe21DaysWidget(),
                          );
                        },
                      );
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DayChallenge21Widget(),
                        ),
                      );
                    },
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Color(0xFFF5F5F5),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 0),
                                  child: FaIcon(
                                    FontAwesomeIcons.medal,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 24,
                                  ),
                                ),
                                Text(
                                  '21 Day Challenge',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                            if (!(currentUserDocument?.subscriptionList
                                    .contains(functions
                                        .return21DayChallengeText())) ??
                                true)
                              AuthUserStreamWidget(
                                child: Text(
                                  '2.99/year',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                            if (currentUserDocument?.subscriptionList.contains(
                                    functions.return21DayChallengeText()) ??
                                true)
                              AuthUserStreamWidget(
                                child: Text(
                                  'Subscribed',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 2, 2, 2),
                  child: InkWell(
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: Subscribe90DaysWidget(),
                          );
                        },
                      );
                    },
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Color(0xFFF5F5F5),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 0),
                                  child: FaIcon(
                                    FontAwesomeIcons.medal,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 24,
                                  ),
                                ),
                                Text(
                                  '90 Day Challenge',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                            Text(
                              '4.98/year',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 5),
                  child: Text(
                    'DAILY SUCCESS TOOLS',
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 2, 2, 2),
                  child: InkWell(
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: DailySuccessPlannerWidget(),
                          );
                        },
                      );
                    },
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Color(0xFFF5F5F5),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 0),
                                  child: FaIcon(
                                    FontAwesomeIcons.book,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 24,
                                  ),
                                ),
                                Text(
                                  'Daily Success Planner',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                            Text(
                              '12.99/year',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 2, 2, 2),
                  child: InkWell(
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: FinancialPlannerWidget(),
                          );
                        },
                      );
                    },
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Color(0xFFF5F5F5),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 0),
                                  child: FaIcon(
                                    FontAwesomeIcons.book,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 24,
                                  ),
                                ),
                                Text(
                                  'Daily Financial Planner',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                            Text(
                              '12.99/year',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 2, 2, 2),
                  child: InkWell(
                    onTap: () async {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Subscribe'),
                            content: Text(
                                'Subscribe on the Daily Goal Book for \$4.99 per year'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  Navigator.pop(alertDialogContext);

                                  final subscriptionCreateData =
                                      createSubscriptionRecordData(
                                    uid: currentUserUid,
                                    subscriptionName: 'Daily Goal Book',
                                    subscriptionDate: getCurrentTimestamp,
                                    subscriptionCost: 4.99,
                                    active: true,
                                  );
                                  await SubscriptionRecord.collection
                                      .doc()
                                      .set(subscriptionCreateData);
                                  ;
                                },
                                child: Text('Subscribe'),
                              ),
                            ],
                          );
                        },
                      );
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.scale,
                          alignment: Alignment.bottomCenter,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
                          child: GoalBookWidget(),
                        ),
                      );
                    },
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Color(0xFFF5F5F5),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 0),
                                  child: FaIcon(
                                    FontAwesomeIcons.book,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 24,
                                  ),
                                ),
                                Text(
                                  'Daily Goal Book',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                            Text(
                              '4.99/year',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ],
                        ),
                      ),
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
