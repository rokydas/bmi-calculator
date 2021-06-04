import 'package:bmi_calculator/inputPage.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, @required this.cardChild, @required this.updateGenderActivity, @required this.isMale});

  final Color colour;
  final Widget cardChild;
  final Function updateGenderActivity;
  final bool isMale;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => updateGenderActivity( isMale ? 'male' : 'female'),
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}