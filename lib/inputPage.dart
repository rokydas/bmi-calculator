import 'package:bmi_calculator/gender_column.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/round_icon_button.dart';
import 'package:bmi_calculator/weight_age_column.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

import 'common_styles.dart';

enum Gender {
    male,
    female,
}

Gender selectedGender;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  double currentValue = 150;
  int weight = 63;
  int age = 22;

  Function updateWeightAge({String type, bool operation}) {
    if(operation && type == "weight") weight++;
    else if(operation && type == "age") age++;
    else if(!operation && type == "weight") weight--;
    else if(!operation && type == "age") age--;
  }

  Function updateGenderActivity(gender) {
      setState(() {
        gender == 'male' ? selectedGender = Gender.male : selectedGender = Gender.female;
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        colour: selectedGender == Gender.male ? kActiveColor : kInActiveColor,
                        cardChild: CardColumn(text: 'MALE'),
                        updateGenderActivity: updateGenderActivity,
                        isMale: true,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                        colour: selectedGender == Gender.female ? kActiveColor : kInActiveColor,
                        cardChild: CardColumn(text: 'FEMALE'),
                        updateGenderActivity: updateGenderActivity,
                        isMale: false,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: HexColor('FF323244'),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kLabelStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(currentValue.round().toString(), style: kNumberStyle),
                        Text('cm', style: kLabelStyle)
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: HexColor('#e83d66'),
                        inactiveTrackColor: Colors.grey,
                        thumbColor: HexColor('#e83d66'),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                        value: currentValue,
                        min: 120,
                        max: 220,
                        onChanged: (double value) {
                          setState(() {
                            currentValue = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                        colour: HexColor('FF323244'),
                        cardChild: WeightAgeColumn(
                          type: 'WEIGHT', number: weight,
                          onPlusPressed: () {
                            setState(() {
                              updateWeightAge(type: 'weight', operation: true);
                            });
                          },
                          onMinusPressed: () {
                            setState(() {
                              updateWeightAge(type: 'weight', operation: false);
                            });
                          },
                        ),
                      ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: HexColor('FF323244'),
                       cardChild: WeightAgeColumn(
                        type: 'AGE', number: age,
                        onPlusPressed: () {
                          setState(() {
                            updateWeightAge(type: 'age', operation: true);
                          });
                        },
                        onMinusPressed: () {
                          setState(() {
                            updateWeightAge(type: 'age', operation: false);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: HexColor('#e83d66'),
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: kBottomButtonHeight,
              child: Center(
                child: Text(
                    'CALCULATE BMI',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}