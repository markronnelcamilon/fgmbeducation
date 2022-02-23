import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../day_challenge90/day_challenge90_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class Subscribe90DaysWidget extends StatefulWidget {
  const Subscribe90DaysWidget({Key key}) : super(key: key);

  @override
  _Subscribe90DaysWidgetState createState() => _Subscribe90DaysWidgetState();
}

class _Subscribe90DaysWidgetState extends State<Subscribe90DaysWidget> {
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
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 20),
            child: Text(
              'Subscribe to 90 Days Challenge and Win your day.',
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
                  color: Colors.transparent,
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
                  final ninetyDaysCounterCreateData =
                      createNinetyDaysCounterRecordData(
                    uid: currentUserUid,
                    noOfDays: 0,
                    subscriptionId: '${currentUserUid}21DayChallenge',
                    startDate: getCurrentTimestamp,
                    endDate: functions.add21DaysToCurrentDay(),
                  );
                  await NinetyDaysCounterRecord.collection
                      .doc()
                      .set(ninetyDaysCounterCreateData);

                  final subscriptionCreateData = createSubscriptionRecordData(
                    uid: currentUserUid,
                    subscriptionName: '90 Day Challenge',
                    subscriptionDate: getCurrentTimestamp,
                    subscriptionCost: 2.99,
                    active: true,
                  );
                  await SubscriptionRecord.collection
                      .doc()
                      .set(subscriptionCreateData);

                  final usersUpdateData = {
                    'subscription_list':
                        FieldValue.arrayUnion(['21 Day Challenge']),
                  };
                  await currentUserReference.update(usersUpdateData);
                  await actions.addninetydays();
                  await Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DayChallenge90Widget(),
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
