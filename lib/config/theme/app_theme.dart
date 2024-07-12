import 'package:flutter/material.dart';
import 'package:social_butterfly/core/constants/paddings.dart';
import '../../core/constants/border_radius.dart';

class AppTheme {
  final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: _AppColors.backgroundColor,
    textTheme: textThemes.textTheme,
    primaryColor: _AppColors.primaryColor,

    /// App bar theme
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      foregroundColor: _AppColors.darkTextColor,
    ),

    /// Input decoration
    inputDecorationTheme: InputDecorationTheme(
      fillColor: _AppColors.backgroundColor,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: AppBorderRadius.smallBorderRadius,
        borderSide: BorderSide(
          color: _AppColors.primaryColor.withOpacity(0.25),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppBorderRadius.smallBorderRadius,
        borderSide: BorderSide(
          color: _AppColors.primaryColor,
        ),
      ),
      hintStyle: TextStyle(
        color: _AppColors.darkTextColor.withOpacity(0.25),
        fontWeight: FontWeight.normal,
      ),
    ),

    /// Elevated Button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.smallBorderRadius,
        ),
        foregroundColor: _AppColors.backgroundColor,
        padding: EdgeInsets.symmetric(vertical: AppPaddings.mediumPadding),
      ),
    ),

    /// Outlined Button theme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.smallBorderRadius,
        ),
        padding: EdgeInsets.symmetric(
          vertical: AppPaddings.mediumPadding,
          horizontal: AppPaddings.mediumPadding,
        ),
      ),
    ),
    dividerTheme: DividerThemeData(
      color: _AppColors.darkTextColor,
    ),
  );
  ThemeData get lightTheme => _lightTheme;

  static var textThemes = _AppTextThemes();
}

class _AppColors {
  static Color backgroundColor = const Color(0xffF4F4F9);
  static Color primaryColor = const Color(0xff9046CF);
  static Color secondaryColor = const Color(0xff2660A4);
  static Color darkTextColor = const Color(0xff0A2342);
  static Color lightTextColor = const Color(0xffF4F4F9);
}

class _AppTextThemes {
  final TextTheme textTheme = TextTheme();
}
