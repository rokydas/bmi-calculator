import 'package:bmi_calculator/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'common_styles.dart';

class WeightAgeColumn extends StatelessWidget {
  WeightAgeColumn({@required this.number, @required this.type, @required this.onPlusPressed, @required this.onMinusPressed});

  String type;
  int number;
  final Function onPlusPressed;
  final Function onMinusPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(type, style: kLabelStyle),
        SizedBox(height: 5,),
        Text('$number', style: kNumberStyle),
        SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: onPlusPressed ),
            SizedBox(width: 10,),
            RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: onMinusPressed ),
          ],
        )
      ],
    );
  }
}
