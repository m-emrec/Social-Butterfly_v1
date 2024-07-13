import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/auth_manager.dart';
import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/auth/presentation/pages/sign_in_page.dart';
import '../../features/auth/presentation/pages/sign_up_page.dart';
import '../../features/create post/presentation/pages/create_post_page.dart';
import '../../features/home/presentation/pages/home_page.dart';

class AppRoutes {
  final Map<String, Widget Function(BuildContext)> _routes = {
    "/": (_) => const AuthManager(),
    SignInPage.routeName: (_) => const SignInPage(),
    SignUpPage.routeName: (_) => const SignUpPage(),
    ForgotPasswordPage.routeName: (_) => const ForgotPasswordPage(),
    HomePage.routeName: (_) => const HomePage(),
    CreatePostPage.routeName: (_) => const CreatePostPage(),
  };

  Map<String, Widget Function(BuildContext)> get routes => _routes;
}
