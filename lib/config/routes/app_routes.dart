import 'package:flutter/material.dart';
import 'package:social_butterfly/main.dart';

class AppRoutes {
  final Map<String, Widget Function(BuildContext)> _routes = {
    "/": (_) => const MyHomePage(title: "title"),
  };

  Map<String, Widget Function(BuildContext)> get routes => _routes;
}
