import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../daily_financial_tracker/daily_financial_tracker_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FinancialPlannerWidget extends StatefulWidget {
  const FinancialPlannerWidget({Key key}) : super(key: key);

  @override
  _FinancialPlannerWidgetState createState() => _FinancialPlannerWidgetState();
}

class _FinancialPlannerWidgetState extends State<FinancialPlannerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.tertiaryColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: Text(
              'Subscribe Now!',
              style: FlutterFlowTheme.title1,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Text(
              'Subscribe to daily financial planner',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.title3,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: 'Cancel',
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: Colors.transparent,
                  textStyle: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Poppins',
                    color: Color(0xFFCFB53B),
                  ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: 12,
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  final dailyExpenseTrackerCreateData =
                      createDailyExpenseTrackerRecordData(
                    uid: currentUserUid,
                    subscriptionId: '${currentUserUid}21DayChallenge',
                    startingBalance: 0.0,
                    totalSpending: 0.0,
                    total: 0,
                    noOfWants: 0,
                    noOfNeeds: '0',
                    spendingWants: 0.0,
                    spendingNeeds: 0.0,
                    endOfDayBalance: 0.0,
                  );
                  await DailyExpenseTrackerRecord.collection
                      .doc()
                      .set(dailyExpenseTrackerCreateData);

                  final subscriptionCreateData = createSubscriptionRecordData(
                    uid: currentUserUid,
                    subscriptionName: 'Daily Financial Planner',
                    subscriptionDate: getCurrentTimestamp,
                    subscriptionCost: 2.99,
                    active: true,
                  );
                  await SubscriptionRecord.collection
                      .doc()
                      .set(subscriptionCreateData);
                  await actions.quarterlyGoals();
                  final usersUpdateData = {
                    'subscription_list':
                        FieldValue.arrayUnion(['21 Day Challenge']),
                  };
                  await currentUserReference.update(usersUpdateData);
                  await Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DailyFinancialTrackerWidget(),
                    ),
                    (r) => false,
                  );
                },
                text: 'Subscribe',
                options: FFButtonOptions(
                  width: 130,
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
        ],
      ),
    );
  }
}
