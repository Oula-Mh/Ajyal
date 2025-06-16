import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: AppColor.primaryColor,
  // appBarTheme: AppBarTheme(
  //   // shadowColor: AppColors.lightGray,
  //   color: AppColors.white,
  //   elevation: 2,
  //   toolbarTextStyle: const TextTheme(
  //     titleLarge: AppTextStyle.xxxLargeBlack,
  //   ).bodyLarge,
  //   titleTextStyle: const TextTheme(
  //     titleLarge: AppTextStyle.xxxLargeBlack,
  //   ).titleLarge,
  //   systemOverlayStyle: SystemUiOverlayStyle.light,
  // ),
  fontFamily: "Cairo",
  scaffoldBackgroundColor: AppColor.white1,
  textTheme: const TextTheme(
    // headlineLarge: AppTextStyle.xxxLargeBlack,
    // headlineMedium: AppTextStyle.xLargeBlack,
    // titleMedium: AppTextStyle.xSmallBlack,
    // titleSmall: AppTextStyle.smallBlack,
    // bodyLarge: AppTextStyle.largeBlack,
    // bodyMedium: AppTextStyle.mediumBlack,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColor.primaryColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: AppColor.fillTextField,
    contentPadding: EdgeInsets.symmetric(horizontal: 10),
    // border: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(10.sp),
    //     borderSide: const BorderSide(color: AppColors.white, width: 1)),
    // enabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(10.sp),
    //     borderSide: const BorderSide(color: AppColors.white, width: 1)),
    // focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(10.sp),
    //     borderSide: const BorderSide(color: AppColors.white, width: 1)),
    errorMaxLines: 2,
  ),
);
