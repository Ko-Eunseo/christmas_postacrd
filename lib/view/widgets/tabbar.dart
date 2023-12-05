import 'package:christmas_postcard/styles/app_color_styles.dart';
import 'package:christmas_postcard/view/widgets/palette.dart';
import 'package:christmas_postcard/view/widgets/tab/tabbar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({
    super.key,
  });

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> with SingleTickerProviderStateMixin {
  Color selectedColor = AppColors.blueColor;

  @override
  Widget build(BuildContext context) {
    int tabLength = 3;
    List<String> tabList = ['assets/trees/tree1.svg', 'assets/items/item1.png'];
    List<Widget> tabbarView = [
      const TabbarView(type: AssetType.tree),
      const TabbarView(type: AssetType.item),
      Palette(
        onChanged: (color) {
          print('Selected Color: $color');
          selectedColor = color;
        },
      ),
    ];

    return DefaultTabController(
      length: tabLength,
      child: SizedBox(
        height: 200,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TabBar(
              unselectedLabelColor: AppColors.greyColor,
              labelColor: Colors.white,
              labelPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              tabs: [
                Tab(
                  icon: SvgPicture.asset(tabList[0]),
                ),
                Tab(
                  icon: Image.asset(tabList[1]),
                ),
                const Tab(
                  icon: Icon(
                    Icons.circle,
                    color: AppColors.blueColor,
                  ),
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

class TabItem extends StatelessWidget {
  const TabItem({
    super.key,
    required this.child,
    required this.isActive,
  });

  final Widget child;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: isActive ? Colors.white : AppColors.greyColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: child,
    );
  }
}
