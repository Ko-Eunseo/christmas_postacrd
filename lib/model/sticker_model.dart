// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StickerModel {
  final String id;
  final String name;
  double top;
  double left;
  double width;
  double height;
  double angle;

  StickerModel({
    required this.id,
    required this.name,
    this.top = 0.0,
    this.left = 0.0,
    this.width = 50.0,
    this.height = 50.0,
    this.angle = 0.0,
  });

  StickerModel copyWith({
    String? id,
    String? name,
    double? top,
    double? left,
    double? width,
    double? height,
    double? angle,
  }) {
    return StickerModel(
      id: id ?? this.id,
      name: name ?? this.name,
      top: top ?? this.top,
      left: left ?? this.left,
      width: width ?? this.width,
      height: height ?? this.height,
      angle: angle ?? this.angle,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'top': top,
      'left': left,
      'width': width,
      'height': height,
      'angle': angle,
    };
  }

  factory StickerModel.fromMap(Map<String, dynamic> map) {
    return StickerModel(
      id: map['id'],
      name: map['name'],
      top: map['top'],
      left: map['left'],
      width: map['width'],
      height: map['height'],
      angle: map['angle'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StickerModel.fromJson(String source) =>
      StickerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StickerModel(id: $id,name: $name, top: $top, left: $left, width: $width, height: $height, angle: $angle)';
  }
}
