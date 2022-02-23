import '../daily_expense_tracker_input/daily_expense_tracker_input_widget.dart';
import '../daily_financial_tracker/daily_financial_tracker_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyExpenseTrackerListWidget extends StatefulWidget {
  const DailyExpenseTrackerListWidget({Key key}) : super(key: key);

  @override
  _DailyExpenseTrackerListWidgetState createState() =>
      _DailyExpenseTrackerListWidgetState();
}

class _DailyExpenseTrackerListWidgetState
    extends State<DailyExpenseTrackerListWidget> {
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
          'Daily Expense Traker',
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DailyExpenseTrackerInputWidget(),
            ),
          );
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        icon: Icon(
          Icons.add,
        ),
        elevation: 8,
        label: Text(
          'Add ',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DailyFinancialTrackerWidget(),
                  ),
                );
              },
              child: ListTile(
                title: Text(
                  'January 01, 2021',
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                      ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF303030),
                  size: 20,
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
