import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    hintColor: AppColors.hint,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    fontFamily: AppStrings.fontFamily,
    useMaterial3: false,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        height: 1.5,
        fontSize: 18.0,
        // fontWeight: FontWeight.bold,
      ),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: false,
      foregroundColor: AppColors.black,
      backgroundColor: AppColors.white,
      elevation: 0.0,
      titleTextStyle: const TextStyle(
        fontSize: 22.0,
        letterSpacing: 1.5,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

ThemeData appDarkTheme() {
  return ThemeData(
    primaryColor: AppColors.white,
    hintColor: AppColors.hint,
    useMaterial3: false,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.blackLite,
    fontFamily: AppStrings.fontFamily,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        height: 1.5,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: false,
      foregroundColor: AppColors.white,
      backgroundColor: AppColors.blackLite,
      elevation: 0.0,
      titleTextStyle: const TextStyle(
        fontSize: 22.0,
        letterSpacing: 1.5,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
