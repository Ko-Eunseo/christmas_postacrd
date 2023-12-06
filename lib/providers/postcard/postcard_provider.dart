import 'package:christmas_postcard/model/sticker_model.dart';
import 'package:christmas_postcard/providers/postcard/postcard_state.dart';
import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:uuid/uuid.dart';

class PostcardProvider extends StateNotifier<PostcardState> with LocatorMixin {
  PostcardProvider() : super(PostcardState.init());

  StickerModel? _selectedSticker;

  StickerModel? get selectedSticker => _selectedSticker;

  void updateSelectedSticker(StickerModel? sticker) {
    _selectedSticker = sticker;
  }

  void addSticker(BuildContext context, String name) async {
    state = state.copyWith(postcardStatus: PostcardStatus.editting);
    try {
      String id = const Uuid().v1();
      //스티커 생성
      StickerModel newSticker = StickerModel(
        id: id,
        name: name,
        top: MediaQuery.of(context).size.width * 0.3,
      );

      updateSelectedSticker(newSticker);

      // 기존 스티커 리스트에 새로운 스티커 추가
      state = state.copyWith(
        stickers: [
          ...state.stickers,
          StickerModel(
            id: newSticker.id,
            name: newSticker.name,
            top: newSticker.top,
            left: newSticker.left,
            width: newSticker.width,
            height: newSticker.height,
          ),
        ],
      );
    } catch (_) {
      rethrow;
    }
  }

  void removeSticker(StickerModel sticker) async {
    state = state.copyWith(postcardStatus: PostcardStatus.editting);
    try {
      state = state.copyWith(
        stickers: List.from(state.stickers)..remove(sticker),
      );
    } catch (_) {
      rethrow;
    }
  }

  void updateStickerPosition(
    BuildContext context,
    StickerModel sticker,
    double deltaX,
    double deltaY,
  ) {
    state = state.copyWith(postcardStatus: PostcardStatus.editting);
    final updatedStickers = List<StickerModel>.from(state.stickers);
    final index = updatedStickers.indexOf(sticker);
    if (index != -1) {
      updatedStickers[index] = sticker.copyWith(
        //@tip: clamp 쓰면 범위가 고정됨. 안쓰는 게 낫다.
        left: (sticker.left + deltaX),
        top: (sticker.top + deltaY),
      );
      state = state.copyWith(stickers: updatedStickers);
    }
    print('location mode');
  }

  void updateStickerSize(
    BuildContext context,
    StickerModel sticker,
    double scale,
  ) {
    state = state.copyWith(postcardStatus: PostcardStatus.editting);
    final updatedStickers = List<StickerModel>.from(state.stickers);
    final index = updatedStickers.indexOf(sticker);
    if (index != -1) {
      updatedStickers[index] = sticker.copyWith(
        width: (sticker.width * scale).clamp(0.0, 200.0),
        height: (sticker.height * scale).clamp(0.0, 200.0),
      );
      state = state.copyWith(stickers: updatedStickers);
    }
    print('scale mode');
  }
}
