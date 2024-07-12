import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;

  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  Size get screenSize => mediaQuery.size;
  double get keyboardSize => mediaQuery.viewInsets.bottom;

  double dynamicWidth(double? val) => screenSize.width * (val ?? 1);
  double dynamicHeight(double? val) => screenSize.height * (val ?? 1);
}

extension ScaffoldMessengerExtension on BuildContext {
  showSnack(snackBar) => ScaffoldMessenger.of(this).showSnackBar(snackBar);
}

extension NavigationExtension on BuildContext {
  NavigatorState get navigator => Navigator.of(this);
  Future<T?> pushNamed<T extends Object?>(route, {Object? arguments}) =>
      navigator.pushNamed(route, arguments: arguments);
  pop() => navigator.pop();
  pushReplacementNamed(routeName) => navigator.pushReplacementNamed(routeName);
}
