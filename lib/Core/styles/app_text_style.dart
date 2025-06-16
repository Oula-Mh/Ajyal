import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/cupertino.dart';

abstract class Styles {
  static const logoAr = TextStyle(fontSize: 12, fontWeight: FontWeight.normal);
  static const logoEn = TextStyle(fontSize: 14, fontWeight: FontWeight.normal);
  static const largeWhite = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColor.white1,
  );
  static const meduimWhite = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColor.white1,
  );

  static const meduimGray = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Color(0xFFAC9F9F),
  );

  static const meduimBlack = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColor.black1,
  );

  static const largeBlack = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w500,
    color: AppColor.black1,
  );
}

const TextStyle textStyle = TextStyle();
