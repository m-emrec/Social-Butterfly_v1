import 'package:flutter/material.dart';
import '../../data/datasources/auth_injection_container.dart';
import '../widgets/base_auth_page.dart';

mixin BaseAuthPageMixin on State<BaseAuthPage> {
  Widget get divider => const Row(
        children: [
          Expanded(child: Divider()),
          Text("OR"),
          Expanded(child: Divider()),
        ],
      );
  @override
  void dispose() {
    super.dispose();
    AuthInjectionContainer().dispose();
  }
}
