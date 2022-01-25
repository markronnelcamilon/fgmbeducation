// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:progress_indicator/progress_indicator.dart';

class CircularProgressIndicator extends StatefulWidget {
  const CircularProgressIndicator({
    Key key,
    this.width,
    this.height,
    this.daysChallenge,
  }) : super(key: key);

  final double width;
  final double height;
  final double daysChallenge;

  @override
  _CircularProgressIndicatorState createState() =>
      _CircularProgressIndicatorState();
}

class _CircularProgressIndicatorState extends State<CircularProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      child: CircularProgress(
        percentage: widget.daysChallenge,
        color: Colors.amber,
        backColor: Colors.grey,
        gradient: LinearGradient(colors: [Colors.blue, Colors.red]),
        showPercentage: true,
        textStyle: TextStyle(color: Colors.orange, fontSize: 20),
        stroke: 5,
        round: true,
      ),
    );
  }
}
