import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
          width: 40,
          height: 40
      ),
      elevation: 0.0,
      shape: CircleBorder(),
      child: Icon(icon),
      onPressed: onPressed,
      fillColor: HexColor('#e83d66'),
    );
  }
}