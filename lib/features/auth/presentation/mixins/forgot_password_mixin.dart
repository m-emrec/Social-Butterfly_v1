import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../bloc/auth_bloc.dart';
import '../pages/forgot_password_page.dart';

mixin ForgotPasswordMixin on State<ForgotPasswordPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  late AuthBloc authBloc;

  final String forgotPassword = 'Forgot Password';
  final String successMssg = "Reset email has been send to your email address.";
  final String buttonText = "Send Reset Email";

  onForgotPasswordButtonPressed() {
    if (formKey.currentState!.validate()) {
      authBloc.add(
        AuthForgotPasswordEvent(
          email: emailController.text,
        ),
      );
    }
  }

  onGoogleSignInPressed() {
    authBloc.add(const AuthSignInWithGoogleEvent());
  }

  @override
  void initState() {
    super.initState();
    authBloc = GetIt.instance();
  }
}
