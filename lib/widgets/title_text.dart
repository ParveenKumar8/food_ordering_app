import 'package:flutter/material.dart';
import 'package:food_ordering_app/utils/dimensions.dart';

class TitleText extends StatelessWidget {
  Color? color;
  final String text;
  double textSize;
  TextOverflow textOverflow;

  TitleText(
      {Key? key,
      this.color = const Color(0xFF332d2b),
      required this.text,
      this.textSize = 0.0,
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
        fontSize: textSize == 0 ? Dimensions.FONT_20 : textSize,
      ),
    );
  }
}
