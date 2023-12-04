import 'package:flutter/material.dart';

class AppTextStyles {
  static const black =
      TextStyle(fontFamily: 'Pretendard', fontWeight: FontWeight.w900);
  static const bold =
      TextStyle(fontFamily: 'Pretendard', fontWeight: FontWeight.w700);
  static const semiBold =
      TextStyle(fontFamily: 'Pretendard', fontWeight: FontWeight.w600);
  static const medium =
      TextStyle(fontFamily: 'Pretendard', fontWeight: FontWeight.w500);
  static const light =
      TextStyle(fontFamily: 'Pretendard', fontWeight: FontWeight.w300);

  static TextStyle headline50({Color color = Colors.black}) =>
      black.copyWith(fontSize: 50, color: color);
  static TextStyle header32({Color color = Colors.black}) =>
      semiBold.copyWith(fontSize: 32, color: color);
  static TextStyle header24({Color color = Colors.black}) =>
      semiBold.copyWith(fontSize: 24, color: color);
  static TextStyle header20({Color color = Colors.black}) =>
      medium.copyWith(fontSize: 20, color: color);
  static TextStyle header20B({Color color = Colors.black}) =>
      semiBold.copyWith(fontSize: 20, color: color);
  static TextStyle body16B({Color color = Colors.black}) =>
      semiBold.copyWith(fontSize: 16, color: color);
  static TextStyle body16M({Color color = Colors.black}) =>
      medium.copyWith(fontSize: 16, color: color);
  static TextStyle body14B({Color color = Colors.black}) =>
      semiBold.copyWith(fontSize: 14, color: color);
  static TextStyle body14M({Color color = Colors.black}) =>
      medium.copyWith(fontSize: 14, color: color);
  static TextStyle body12B({Color color = Colors.black}) =>
      semiBold.copyWith(fontSize: 12, color: color);
  static TextStyle body12M({Color color = Colors.black}) =>
      medium.copyWith(fontSize: 12, color: color);
}
