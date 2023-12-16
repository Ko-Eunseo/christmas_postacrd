import 'package:christmas_postcard/model/sticker_model.dart';
import 'package:christmas_postcard/providers/sticker/sticker_provider.dart';
import 'package:christmas_postcard/providers/sticker/sticker_state.dart';
import 'package:christmas_postcard/styles/app_color_styles.dart';
import 'package:christmas_postcard/view/widgets/headline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum EditType {
  scale,
  locate,
}

class EditTree extends StatefulWidget {
  const EditTree({
    super.key,
    this.themeColor,
  });
  final Color? themeColor;

  @override
  State<EditTree> createState() => _EditTreeState();
}

class _EditTreeState extends State<EditTree> {
  EditType? type;
  int padding = 8;

  @override
  void initState() {
    super.initState();
    type = EditType.locate;
  }

  @override
  Widget build(BuildContext context) {
    List<StickerModel> stickers = context.watch<StickerState>().stickerList;
    StickerModel? selectedSticker =
        context.watch<StickerProvider>().selectedSticker;
    StickerProvider stickerProvider =
        Provider.of<StickerProvider>(context, listen: false);

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
          // clipBehavior: Clip.hardEdge, //@todo 오버플로우 hidden
          child: Stack(
            children: [
              CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.45,
                backgroundColor: widget.themeColor ?? AppColors.blueColor,
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
              for (var sticker in stickers)
                Positioned(
                  top: sticker.top,
                  left: sticker.left,
                  child: GestureDetector(
                    onTap: () {
                      //@why? setstate를 하지 않으면 바로바로 적용이 안됨
                      setState(() {
                        stickerProvider.updateSelectedSticker(sticker);
                      });
                    },
                    onPanUpdate: (details) {
                      if (sticker.id != selectedSticker?.id) {
                        stickerProvider.updateSelectedSticker(sticker);
                      }
                      stickerProvider.updateStickerPosition(
                        context,
                        sticker,
                        details.delta.dx * 2.0,
                        details.delta.dy * 2.0,
                      );
                    },
                    // onScaleUpdate:
                    //     type == EditType.scale
                    //         ? //
                    //         (details) {
                    //             postcardProvider.updateStickerSize(
                    //               context,
                    //               sticker,
                    //               details.scale,
                    //             );
                    //           }
                    //         : null,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: sticker.id == selectedSticker?.id
                              ? AppColors.redColor
                              : Colors.transparent,
                          width: 4,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Image.asset(
                        sticker.name,
                        width: sticker.width,
                        height: sticker.height,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
