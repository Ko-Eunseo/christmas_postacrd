import 'package:christmas_postcard/model/sticker_model.dart';
import 'package:christmas_postcard/providers/sticker/sticker_state.dart';
import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:uuid/uuid.dart';

class StickerProvider extends StateNotifier<StickerState> with LocatorMixin {
  StickerProvider() : super(StickerState.init());

  StickerModel? _selectedSticker;

  StickerModel? get selectedSticker => _selectedSticker;

  void updateSelectedSticker(StickerModel? sticker) {
    //선택된 스티커
    _selectedSticker = sticker;
  }

  void addSticker(BuildContext context, String name) async {
    state = state.copyWith(stickerStatus: StickerStatus.editting);
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
        stickerList: [
          ...state.stickerList,
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
    state = state.copyWith(stickerStatus: StickerStatus.editting);
    try {
      state = state.copyWith(
        stickerList: List.from(state.stickerList)..remove(sticker),
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
    state = state.copyWith(stickerStatus: StickerStatus.editting);
    final updatedStickers = List<StickerModel>.from(state.stickerList);
    final index = updatedStickers.indexOf(sticker);
    if (index != -1) {
      updatedStickers[index] = sticker.copyWith(
        left: (sticker.left + deltaX),
        top: (sticker.top + deltaY),
      );
      state = state.copyWith(stickerList: updatedStickers);
    }
    print('location mode');
  }

  void updateStickerSize(
    BuildContext context,
    StickerModel sticker,
    double scale,
  ) {
    state = state.copyWith(stickerStatus: StickerStatus.editting);
    final updatedStickers = List<StickerModel>.from(state.stickerList);
    final index = updatedStickers.indexOf(sticker);
    if (index != -1) {
      updatedStickers[index] = sticker.copyWith(
        width: (sticker.width * scale).clamp(0.0, 200.0),
        height: (sticker.height * scale).clamp(0.0, 200.0),
      );
      state = state.copyWith(stickerList: updatedStickers);
    }
    print('scale mode');
  }
}
