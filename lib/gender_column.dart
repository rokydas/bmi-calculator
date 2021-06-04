import 'package:bmi_calculator/common_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardColumn extends StatelessWidget {
  CardColumn({@required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          text == "MALE" ? FontAwesomeIcons.mars : FontAwesomeIcons.venus,
          size: 70,
        ),
        SizedBox(height: 5,),
        Text(
          text,
          style: kLabelStyle
        ),
      ],
    );
  }
}