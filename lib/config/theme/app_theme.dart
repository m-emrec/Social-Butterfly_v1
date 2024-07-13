import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/constants/paddings.dart';
import '../../core/constants/border_radius.dart';

class AppTheme {
  final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    textTheme: textThemes.textTheme,
    primaryColor: AppColors.primaryColor,

    /// App bar theme
    appBarTheme: _appBarTheme,

    /// Input decoration
    inputDecorationTheme: _inputDecoration,

    // Card Theme
    cardTheme: const CardTheme(
      elevation: 0,
    ),

    /// Elevated Button theme
    elevatedButtonTheme: _elevatedButtonTheme,

    /// Outlined Button theme
    outlinedButtonTheme: _outlinedButtonTheme,

    /// Icon button theme
    iconButtonTheme: _iconButtonTheme,

    dividerTheme: DividerThemeData(
      color: AppColors.darkTextColor,
    ),
  );

  static ElevatedButtonThemeData get _elevatedButtonTheme =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: AppBorderRadius.smallBorderRadius,
          ),
          foregroundColor: AppColors.backgroundColor,
          padding: EdgeInsets.symmetric(vertical: AppPaddings.mediumPadding),
        ),
      );

  static OutlinedButtonThemeData get _outlinedButtonTheme =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: AppBorderRadius.smallBorderRadius,
          ),
          padding: EdgeInsets.symmetric(
            vertical: AppPaddings.mediumPadding,
            horizontal: AppPaddings.mediumPadding,
          ),
        ),
      );

  static IconButtonThemeData get _iconButtonTheme => IconButtonThemeData(
        style: IconButton.styleFrom(
          padding: EdgeInsets.all(
            AppPaddings.xsmallPadding,
          ),
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: AppBorderRadius.mediumBorderRadius,
          ),
        ),
      );

  static InputDecorationTheme get _inputDecoration => InputDecorationTheme(
        fillColor: AppColors.backgroundColor,
        filled: true,
        errorBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.smallBorderRadius,
          borderSide: BorderSide(
            color: AppColors.errorColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.smallBorderRadius,
          borderSide: BorderSide(
            color: AppColors.errorColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.smallBorderRadius,
          borderSide: BorderSide(
            color: AppColors.primaryColor.withOpacity(0.25),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.smallBorderRadius,
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        hintStyle: TextStyle(
          color: AppColors.darkTextColor.withOpacity(0.25),
          fontWeight: FontWeight.normal,
        ),
      );

  static AppBarTheme get _appBarTheme => AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          systemNavigationBarColor: AppColors.backgroundColor,
          statusBarIconBrightness: Brightness.dark,
        ),
        color: Colors.transparent,
        scrolledUnderElevation: 0,
        foregroundColor: AppColors.darkTextColor,
      );

  ThemeData get lightTheme => _lightTheme;

  static var textThemes = _AppTextThemes();
}

class AppColors {
  static Color backgroundColor = const Color(0xffF4F4F9);
  static Color primaryColor = const Color(0xff9046CF);
  static Color secondaryColor = const Color(0xff2660A4);
  static Color darkTextColor = const Color(0xff0A2342);
  static Color lightTextColor = const Color(0xffF4F4F9);
  static Color errorColor = Colors.red.shade600;
}

class _AppTextThemes {
  final TextTheme textTheme = TextTheme();
}
