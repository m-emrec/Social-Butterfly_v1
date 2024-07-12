import 'package:flutter/material.dart';

import '../pages/sign_up_page.dart';

mixin SignUpMixin on State<SignUpPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final String pageTitle = "Sign Up";
  final String textButtonLabel = "Already have an account ?";
  final String primaryButtonLabel = "Sign Up";
  final String googleButtonLabel = "Sign Up With Google";
}
