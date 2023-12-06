// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:christmas_postcard/model/sticker_model.dart';

enum PostcardStatus {
  init,
  fetching,
  editting,
  submitting,
  success,
  error,
}

class PostcardState {
  final PostcardStatus postcardStatus;
  final List<StickerModel> stickers;
  final String? themeColor;

  PostcardState({
    required this.postcardStatus,
    required this.stickers,
    required this.themeColor,
  });

  factory PostcardState.init() {
    return PostcardState(
      postcardStatus: PostcardStatus.init,
      stickers: [],
      themeColor: null,
    );
  }

  PostcardState copyWith({
    PostcardStatus? postcardStatus,
    List<StickerModel>? stickers,
    String? themeColor,
  }) {
    return PostcardState(
      postcardStatus: postcardStatus ?? this.postcardStatus,
      stickers: stickers ?? this.stickers,
      themeColor: themeColor ?? this.themeColor,
    );
  }

  @override
  String toString() =>
      'PostcardState(postcardStatus: $postcardStatus, stickers: $stickers, themeColor: $themeColor)';
}
