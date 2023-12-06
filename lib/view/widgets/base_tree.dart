import 'package:christmas_postcard/providers/postcard/postcard_provider.dart';
import 'package:christmas_postcard/styles/app_color_styles.dart';
import 'package:christmas_postcard/view/widgets/headline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseTree extends StatefulWidget {
  const BaseTree({
    super.key,
    this.backgroundColor,
  });
  final Color? backgroundColor;

  @override
  State<BaseTree> createState() => _BaseTreeState();
}

class _BaseTreeState extends State<BaseTree> {
  int padding = 8;

  @override
  Widget build(BuildContext context) {
    PostcardProvider postcardProvider =
        Provider.of<PostcardProvider>(context, listen: false);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Headline(
            textColor: AppColors.blueColor,
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: [
              CircleAvatar(
                radius: MediaQuery.of(context).size.height * 0.25,
                backgroundColor: widget.backgroundColor ?? AppColors.blueColor,
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Image.asset(
                  'assets/etc/snow_ground.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Image.asset(
                  'assets/trees/tree.png',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
