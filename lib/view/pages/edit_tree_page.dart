import 'package:christmas_postcard/styles/app_color_styles.dart';
import 'package:christmas_postcard/view/widgets/edit_tree.dart';
import 'package:christmas_postcard/view/widgets/tab/tabbar.dart';
import 'package:flutter/material.dart';

class EditTreePage extends StatefulWidget {
  const EditTreePage({super.key});

  @override
  State<EditTreePage> createState() => _EditTreePageState();
}

class _EditTreePageState extends State<EditTreePage>
    with SingleTickerProviderStateMixin {
  bool isEditMode = false;

  void openEditMode() {
    setState(() {
      isEditMode = true;
    });
  }

  void closeEditMode() {
    setState(() {
      isEditMode = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        closeEditMode();
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: ListView(
            // shrinkWrap: isEditMode ? false : true,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const EditTree(),
                  Positioned(
                    bottom: -20,
                    left: 0,
                    right: 0,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        '트리 저장하기',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomSheet: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: isEditMode ? MediaQuery.of(context).size.height * 0.35 : 65,
          child: Tabbar(
            isEditMode: isEditMode,
            openEditMode: openEditMode,
          ),
        ),
      ),
    );
  }
}
