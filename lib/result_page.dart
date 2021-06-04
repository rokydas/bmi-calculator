import 'package:bmi_calculator/common_styles.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100,),
            Text('Your Result', style: kLargeHeadingStyle,),
            SizedBox(height: 20,),
            Text('Normal', style: kBmiResultStyle,),
            SizedBox(height: 20,),
            Text('18.3', style: kNumberStyle,),
            SizedBox(height: 20,),
            Text(
              'Your BMI result is quite low, you should eat more!',
              style: kHeadingStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
