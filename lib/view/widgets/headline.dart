import 'package:christmas_postcard/styles/app_font_styles.dart';
import 'package:flutter/material.dart';

class Headline extends StatelessWidget {
  const Headline({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Merry Christmas',
      style: AppTextStyles.headline50(),
    );
  }
}
