import 'package:christmas_postcard/model/user_model.dart';
import 'package:christmas_postcard/providers/user/user_state.dart';
import 'package:christmas_postcard/styles/app_color_styles.dart';
import 'package:christmas_postcard/styles/app_font_styles.dart';
import 'package:christmas_postcard/util/calculate_d_day.dart';
import 'package:christmas_postcard/view/widgets/headline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    UserModel curUser = context.read<UserState>().userModel;
    double progress = 1 - (calculateDday('12/25') / 25);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: MediaQuery.of(context).size.height * 0.25,
                ),
                const Headline(),
              ],
            ),
            Transform(
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
                        style: AppTextStyles.header20B(
                          color: AppColors.redColor,
                        ),
                      ),
                      Text(
                        'LEFT',
                        style: AppTextStyles.header20B(
                          color: AppColors.redColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
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
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                '엽서 꾸미기',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
