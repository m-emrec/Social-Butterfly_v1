import 'package:flutter/material.dart';

import '../pages/sign_in_page.dart';

mixin SignInMixin on State<SignInPage> {
  final String pageTitle = "Sign In";
  final String textButtonLabel = "Don't have an account ?";
  final String primaryButtonLabel = "Sign In";
  final String googleButtonLabel = "Sign In With Google";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
}
