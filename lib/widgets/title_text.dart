import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  Color? color;
  final String text;
  double textSize;
  TextOverflow textOverflow;

  TitleText(
      {Key? key,
      this.color = const Color(0xFF332d2b),
      required this.text,
      this.textSize = 20.0,
      this.textOverflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: textOverflow,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        color: color,
        fontFamily: 'Roboto',
        fontSize: textSize,
      ),
    );
  }
}
