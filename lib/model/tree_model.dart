// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:christmas_postcard/model/sticker_model.dart';

class TreeModel {
  final String tree;
  final List<StickerModel> items;
  final String? themeColor;
  TreeModel({
    required this.tree,
    required this.items,
    this.themeColor,
  });

  TreeModel copyWith({
    String? tree,
    List<StickerModel>? items,
    String? themeColor,
  }) {
    return TreeModel(
      tree: tree ?? this.tree,
      items: items ?? this.items,
      themeColor: themeColor ?? this.themeColor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tree': tree,
      'items': items.map((x) => x.toMap()).toList(),
      'themeColor': themeColor,
    };
  }

  factory TreeModel.fromMap(Map<String, dynamic> map) {
    return TreeModel(
      tree: map['tree'] as String,
      items: List<StickerModel>.from(
        (map['items'] as List<int>).map<StickerModel>(
          (x) => StickerModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      themeColor:
          map['themeColor'] != null ? map['themeColor'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TreeModel.fromJson(String source) =>
      TreeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TreeModel(tree: $tree, items: $items, themeColor: $themeColor)';

  @override
  bool operator ==(covariant TreeModel other) {
    if (identical(this, other)) return true;

    return other.tree == tree &&
        listEquals(other.items, items) &&
        other.themeColor == themeColor;
  }

  @override
  int get hashCode => tree.hashCode ^ items.hashCode ^ themeColor.hashCode;
}
