import 'package:flutter/material.dart';
import 'package:food_ordering_app/utils/dimensions.dart';

class SecondaryText extends StatelessWidget {
  Color? color;
  String text;
  double textSize;
  double textHeight;

  SecondaryText({
    Key? key,
    this.color = const Color(0xFFccc7c5),
    required this.text,
    this.textSize = 0,
    this.textHeight = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontFamily: 'Roboto',
          fontSize: textSize == 0 ? Dimensions.FONT_12 : textSize,
          height: textHeight),
    );
  }
}
