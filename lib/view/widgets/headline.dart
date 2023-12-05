import 'package:christmas_postcard/styles/app_font_styles.dart';
import 'package:flutter/material.dart';

class Headline extends StatelessWidget {
  final String text;
  final Color textColor;

  const Headline({
    Key? key,
    this.text = 'Merry Christmas',
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.headline50(color: textColor),
    );
  }
}
