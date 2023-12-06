import 'package:christmas_postcard/styles/app_color_styles.dart';
import 'package:christmas_postcard/view/widgets/palette.dart';
import 'package:christmas_postcard/view/widgets/tab/tabbar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({
    super.key,
    required this.isEditMode,
    required this.openEditMode,
  });

  final bool isEditMode;
  final VoidCallback openEditMode;

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> with SingleTickerProviderStateMixin {
  Color selectedColor = AppColors.blueColor;

  @override
  Widget build(BuildContext context) {
    int tabLength = 3;
    List<Widget> tabbarView = [
      const TabbarView(type: AssetType.item),
      Palette(
        onChanged: (color) {
          print('Selected Color: $color');
          selectedColor = color;
        },
      ),
      Palette(
        onChanged: (color) {
          selectedColor = color;
        },
      ),
    ];

    return DefaultTabController(
      length: tabLength,
      child: SizedBox(
        height: 200,
        child: Column(
          children: [
            Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.background,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
                TabBar(
                  indicatorColor: AppColors.redColor,
                  onTap: (_) {
                    widget.openEditMode();
                  },
                  tabs: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Tab(
                        icon: Image.asset('assets/items/item1.png'),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Tab(
                        icon: Icon(
                          Icons.circle,
                          color: AppColors.blueColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Tab(
                        icon: SvgPicture.asset(
                          'assets/icons/pencil.svg',
                          width: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Flexible(
              fit: FlexFit.loose,
              child: TabBarView(
                children: tabbarView,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
