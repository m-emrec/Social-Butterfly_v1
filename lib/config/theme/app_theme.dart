import 'package:flutter/material.dart';

class AppTheme {
  final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: appColors.backgroundColor,
    textTheme: textThemes.textTheme,
  );
  ThemeData get lightTheme => _lightTheme;

  static var appColors = _AppColors();
  static var textThemes = _AppTextThemes();
}

class _AppColors {
  final Color backgroundColor = const Color(0xffF4F4F9);
  final Color primaryColor = const Color(0xff9046CF);
  final Color secondaryColor = const Color(0xff2660A4);
  final Color darkTextColor = const Color(0xff0A2342);
  final Color lightTextColor = const Color(0xffF4F4F9);
}

class _AppTextThemes {
  final TextTheme textTheme = TextTheme(
      //  headlineLarge:  this.headlineLarge.copyWith()
      );
}
