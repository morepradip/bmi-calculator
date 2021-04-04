import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final IconData iconData;
  final String cardName;

  const IconContent({
    this.iconData,
    this.cardName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 60.0,
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          cardName,
          style: kLabelText
        ),
      ],
    );
  }
}
