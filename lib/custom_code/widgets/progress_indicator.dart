// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ProgressIndicator extends StatefulWidget {
  const ProgressIndicator({
    Key key,
    this.width,
    this.height,
    this.noOfDays,
  }) : super(key: key);

  final double width;
  final double height;
  final int noOfDays;

  @override
  _ProgressIndicatorState createState() => _ProgressIndicatorState();
}

class _ProgressIndicatorState extends State<ProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return CircularStepProgressIndicator(
      totalSteps: 21,
      currentStep: widget.noOfDays,
      stepSize: 10,
      selectedColor: Colors.yellow,
      unselectedColor: Colors.grey[200],
      padding: 0,
      width: 80,
      height: 80,
      selectedStepSize: 15,
      roundedCap: (_, __) => true,
    );
  }
}
