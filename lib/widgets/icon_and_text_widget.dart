import 'package:flutter/material.dart';
import 'package:food_ordering_app/utils/dimensions.dart';
import 'package:food_ordering_app/widgets/secondary_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final Color iconColor;
  final String text;
  final IconData icon;

  const IconAndTextWidget(
      {Key? key,
      required this.iconColor,
      required this.text,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimensions.ICON_SIZE_24,
        ),
        const SizedBox(
          width: 5,
        ),
        SecondaryText(
          text: text,
        )
      ],
    );
  }
}
