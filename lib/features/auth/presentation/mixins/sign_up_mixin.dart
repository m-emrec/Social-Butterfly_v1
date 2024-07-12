import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/extensions/context_extension.dart';

import '../bloc/auth_bloc.dart';
import '../pages/sign_in_page.dart';
import '../pages/sign_up_page.dart';

mixin SignUpMixin on State<SignUpPage> {
  final String pageTitle = "Sign Up";
  final String textButtonLabel = "Already have an account ?";
  final String primaryButtonLabel = "Sign Up";
  final String googleButtonLabel = "Sign Up With Google";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late AuthBloc authBloc;

  onSignUpButtonPressed() {
    if (formKey.currentState!.validate()) {
      authBloc.add(AuthSignUpWithEmailEvent(
          email: emailController.text, password: passwordController.text));
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

  void navigateToSignIn(BuildContext context) {
    context.pushReplacementNamed(SignInPage.routeName);
  }
}
