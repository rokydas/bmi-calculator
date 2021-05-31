import 'package:bmi_calculator/icon_column.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

const double bottomButtonHeight = 70.0;
Color inActiveColor = HexColor('FF323244');
Color activeColor = HexColor('#e83d66');

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleColor = inActiveColor;
  Color femaleColor = inActiveColor;

  void updateGenderColor({bool isMale}) {
      if(isMale) {
        maleColor = activeColor;
        femaleColor = inActiveColor;
      }
      else {
        maleColor = inActiveColor;
        femaleColor = activeColor;
      }
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
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateGenderColor(isMale: true);
                        });
                      },
                      child: ReusableCard(
                          colour: maleColor,
                          cardChild: CardColumn(text: 'MALE')
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateGenderColor(isMale: false);
                        });
                      },
                      child: ReusableCard(
                          colour: femaleColor,
                          cardChild: CardColumn(text: 'FEMALE')
                      ),
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
                      style: TextStyle(
                          fontSize: 15
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '181',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 18),
                          child: Text(
                            'cm',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15
                            ),
                          ),
                        )
                      ],
                    ),
                    Slider(
                      activeColor: HexColor('#e83d66'),
                      inactiveColor: Colors.grey,
                      value: 280,
                      min: 100,
                      max: 400,
                      divisions: 300,
                      label: "10",
                      onChanged: (double value) {
                        setState(() {
                          print(value);
                        });
                      },
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
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              '63',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35
                              ),
                            ),
                            SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.plusCircle,
                                  size: 30,
                                ),
                                SizedBox(width: 10,),
                                FaIcon(
                                  FontAwesomeIcons.minusCircle,
                                  size: 30,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: HexColor('FF323244'),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(
                                fontSize: 15
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text(
                            '30',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35
                            ),
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.plusCircle,
                                size: 30,
                              ),
                              SizedBox(width: 10,),
                              FaIcon(
                                FontAwesomeIcons.minusCircle,
                                size: 30,
                              ),
                            ],
                          )
                        ],
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
              height: bottomButtonHeight,
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
