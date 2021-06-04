import 'package:bmi_calculator/inputPage.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      initialRoute: '/input-screen',
      routes: {
        '/input-screen': (context) => InputPage(),
        '/result-screen': (context) => ResultPage()
      },
    );
  }
}