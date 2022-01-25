import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalBookDetailWidget extends StatefulWidget {
  const GoalBookDetailWidget({
    Key key,
    this.goalDetailScreen,
  }) : super(key: key);

  final DocumentReference goalDetailScreen;

  @override
  _GoalBookDetailWidgetState createState() => _GoalBookDetailWidgetState();
}

class _GoalBookDetailWidgetState extends State<GoalBookDetailWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GoalBookRecord>(
      stream: GoalBookRecord.getDocument(widget.goalDetailScreen),
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
        final goalBookDetailGoalBookRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.primaryColor,
            automaticallyImplyLeading: true,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.chevron_left,
                color: Color(0x00000000),
                size: 30,
              ),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        NavBarPage(initialPage: 'SubscirptionPage'),
                  ),
                );
              },
            ),
            actions: [],
            centerTitle: true,
            elevation: 4,
          ),
          backgroundColor: Color(0xFFF1F4F8),
          body: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dateTimeFormat('yMd', goalBookDetailGoalBookRecord.date),
                  style: FlutterFlowTheme.subtitle2,
                ),
                Text(
                  goalBookDetailGoalBookRecord.goal,
                  style: FlutterFlowTheme.bodyText2,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
