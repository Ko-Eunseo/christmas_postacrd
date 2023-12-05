import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum AssetType { item, tree }

int assetLength(AssetType type) {
  switch (type) {
    case AssetType.item:
      return 27;
    case AssetType.tree:
      return 6;
    default:
      return 0;
  }
}

class TabbarView extends StatelessWidget {
  const TabbarView({
    super.key,
    required this.type,
  });
  final AssetType type;

  @override
  Widget build(BuildContext context) {
    final length = assetLength(type);

    return GridView.builder(
      shrinkWrap: true,
      itemCount: length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        String path = 'assets/${type.name}s/';
        String imageName = type == AssetType.tree
            ? '${type.name}${index + 1}.svg'
            : '${type.name}${index + 1}.png';
        return type == AssetType.tree
            ? SvgPicture.asset(path + imageName)
            : Image.asset(path + imageName);
      },
    );
  }
}
