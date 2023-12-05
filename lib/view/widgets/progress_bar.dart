import 'package:christmas_postcard/styles/app_color_styles.dart';
import 'package:christmas_postcard/styles/app_font_styles.dart';
import 'package:christmas_postcard/util/calculate_d_day.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    double barPadding = MediaQuery.of(context).size.width * 0.1;
    double progress = 1 - (calculateDday('12/25') / 25);

    return Column(
      children: [
        //progress text
        Padding(
          padding: EdgeInsets.only(left: barPadding),
          child: Transform(
            transform: Matrix4.skewX(-0.2),
            child: Row(
              children: [
                Text(
                  calculateDday(
                    '12/25',
                  ).toString(),
                  style: AppTextStyles.headline50(
                    color: AppColors.redColor,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'DAYS',
                      style: AppTextStyles.black.copyWith(
                        fontSize: 18,
                        color: AppColors.redColor,
                      ),
                    ),
                    Text(
                      'LEFT',
                      style: AppTextStyles.black.copyWith(
                        fontSize: 18,
                        color: AppColors.redColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        //progress bar
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: barPadding,
          ),
          child: Stack(
            children: [
              Container(
                height: 16,
                decoration: BoxDecoration(
                  color: AppColors.blueColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * progress,
                height: 16,
                decoration: BoxDecoration(
                  color: AppColors.redColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
