import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VvvvWidget extends StatefulWidget {
  const VvvvWidget({Key key}) : super(key: key);

  @override
  _VvvvWidgetState createState() => _VvvvWidgetState();
}

class _VvvvWidgetState extends State<VvvvWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: StreamBuilder<List<SubscritionsTypeRecord>>(
          stream: querySubscritionsTypeRecord(),
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
            List<SubscritionsTypeRecord> listViewSubscritionsTypeRecordList =
                snapshot.data;
            return ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: listViewSubscritionsTypeRecordList.length,
              itemBuilder: (context, listViewIndex) {
                final listViewSubscritionsTypeRecord =
                    listViewSubscritionsTypeRecordList[listViewIndex];
                return Container(width: 100, height: 100, color: Colors.green);
              },
            );
          },
        ),
      ),
    );
  }
}
