import 'package:bodily_bmi_calculator/views/BodilyResultScreen.dart';
import 'package:flutter/material.dart';
import 'views/BodilyBMIScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bodily',
      theme: ThemeData(
        fontFamily: 'wakuwaku',
        primarySwatch: Colors.cyan,
        backgroundColor: Colors.white
      ),
      home: BodilyCalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
