import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../daily_success_planner_list/daily_success_planner_list_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class DailySuccessPlannerWidget extends StatefulWidget {
  const DailySuccessPlannerWidget({Key key}) : super(key: key);

  @override
  _DailySuccessPlannerWidgetState createState() =>
      _DailySuccessPlannerWidgetState();
}

class _DailySuccessPlannerWidgetState extends State<DailySuccessPlannerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).tertiaryColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: Text(
              'Subscribe Now!',
              style: FlutterFlowTheme.of(context).title1,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Text(
              'Subscribe to Daily Success Planner',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).title3,
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
                  color: Color(0xFFF5F5F5),
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
                  await actions.dailySuccessPlanner();
                  final subscriptionCreateData = createSubscriptionRecordData(
                    uid: currentUserUid,
                    subscriptionName: 'Daily Success Planner',
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
                        FieldValue.arrayUnion(['Daily Success Planner']),
                  };
                  await currentUserReference.update(usersUpdateData);
                  await Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DailySuccessPlannerListWidget(),
                    ),
                    (r) => false,
                  );
                },
                text: 'Subscribe',
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
