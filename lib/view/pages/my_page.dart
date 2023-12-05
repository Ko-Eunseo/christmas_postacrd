import 'package:christmas_postcard/model/user_model.dart';
import 'package:christmas_postcard/providers/user/user_state.dart';
import 'package:christmas_postcard/styles/app_color_styles.dart';
import 'package:christmas_postcard/view/pages/edit_tree_page.dart';
import 'package:christmas_postcard/view/widgets/base_tree.dart';
import 'package:christmas_postcard/view/widgets/progress_bar.dart';
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

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //circle
            const BaseTree(),
            const ProgressBar(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditTreePage(),
                  ),
                  (route) => route.isFirst,
                );
              },
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
