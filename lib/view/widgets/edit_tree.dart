import 'package:christmas_postcard/model/sticker_model.dart';
import 'package:christmas_postcard/providers/postcard/postcard_provider.dart';
import 'package:christmas_postcard/providers/postcard/postcard_state.dart';
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
    this.backgroundColor,
  });
  final Color? backgroundColor;

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
    List<StickerModel> stickers = context.watch<PostcardState>().stickers;
    StickerModel? selectedSticker =
        context.watch<PostcardProvider>().selectedSticker;
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
              for (var sticker in stickers)
                Positioned(
                  top: sticker.top,
                  left: sticker.left,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      if (sticker.id == selectedSticker?.id) {
                        postcardProvider.updateStickerPosition(
                          context,
                          sticker,
                          details.delta.dx * 2.0,
                          details.delta.dy * 2.0,
                        );
                        selectedSticker = sticker;
                      }
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
                    onTap: () {
                      if (sticker.id != selectedSticker?.id) {
                        context
                            .read<PostcardProvider>()
                            .updateSelectedSticker(sticker);
                      }
                    },
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
