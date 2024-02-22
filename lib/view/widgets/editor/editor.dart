import 'package:christmas_postcard/styles/app_color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum EditorType {
  sticker,
  pencil,
  text,
}

class Editor extends StatelessWidget {
  const Editor({
    super.key,
    required this.icons,
    required this.functions,
    required this.type,
  });
  final List<SvgPicture> icons;
  final List<Function> functions;
  final EditorType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: type == EditorType.sticker
            ? BorderRadius.circular(20)
            : BorderRadius.circular(25),
      ),
      child: Row(
        children: List.generate(
          icons.length,
          (index) => GestureDetector(
            onTap: () {
              functions[index]();
            },
            child: SvgPicture.asset(
              'assets/icons/${icons[index]}.svg',
            ),
          ),
        ),
      ),
    );
  }
}
