// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';

class Calculator extends StatefulWidget {
  const Calculator({
    Key key,
    this.width,
    this.height,
    this.calculator,
  }) : super(key: key);

  final double width;
  final double height;
  final double calculator;

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return SimpleCalculator(
      theme: const CalculatorThemeData(
        displayColor: Colors.black,
        displayStyle: const TextStyle(fontSize: 80, color: Colors.yellow),
        /*...*/
      ),
    );
  }
}
