import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({Key key}) : super(key: key);

  @override
  _CalculatorWidgetState createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        leading: Icon(
          Icons.arrow_back_ios,
          color: FlutterFlowTheme.tertiaryColor,
          size: 24,
        ),
        title: Text(
          'Calculator',
          style: FlutterFlowTheme.title3.override(
            fontFamily: 'Poppins',
            color: FlutterFlowTheme.tertiaryColor,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: custom_widgets.Calculator(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
        ),
      ),
    );
  }
}
