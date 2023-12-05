import 'package:christmas_postcard/styles/app_color_styles.dart';
import 'package:christmas_postcard/view/widgets/base_tree.dart';
import 'package:christmas_postcard/view/widgets/tabbar.dart';
import 'package:flutter/material.dart';

class EditTreePage extends StatelessWidget {
  const EditTreePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: ListView(
        children: const [
          BaseTree(),
          Tabbar(),
        ],
      ),
    );
  }
}
