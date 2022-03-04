import 'package:flutter/material.dart';

class SecondaryText extends StatelessWidget {
  Color? color;
  final String text;
  double textSize;
  double textHeight;

  SecondaryText({
    Key? key,
    this.color = const Color(0xFFccc7c5),
    required this.text,
    this.textSize = 12.0,
    this.textHeight = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontFamily: 'Roboto',
          fontSize: textSize,
          height: textHeight),
    );
  }
}
