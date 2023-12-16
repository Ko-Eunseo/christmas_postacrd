import 'package:christmas_postcard/model/sticker_model.dart';

enum StickerStatus {
  init,
  editting,
  active,
  set,
}

class StickerState {
  final StickerStatus stickerStatus;
  final List<StickerModel> stickerList;
  StickerState({
    required this.stickerStatus,
    required this.stickerList,
  });

  factory StickerState.init() {
    return StickerState(
      stickerStatus: StickerStatus.init,
      stickerList: [],
    );
  }

  StickerState copyWith({
    StickerStatus? stickerStatus,
    List<StickerModel>? stickerList,
    String? themeColor,
  }) {
    return StickerState(
      stickerStatus: stickerStatus ?? this.stickerStatus,
      stickerList: stickerList ?? this.stickerList,
    );
  }
}
