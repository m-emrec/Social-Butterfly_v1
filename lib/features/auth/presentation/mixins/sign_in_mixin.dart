import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/extensions/context_extension.dart';

import '../bloc/auth_bloc.dart';
import '../pages/sign_in_page.dart';
import '../pages/sign_up_page.dart';

mixin SignInMixin on State<SignInPage> {
  final String pageTitle = "Sign In";
  final String textButtonLabel = "Don't have an account ?";
  final String primaryButtonLabel = "Sign In";
  final String googleButtonLabel = "Sign In With Google";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late AuthBloc authBloc;

  onSignInButtonPressed() {
    authBloc.add(AuthSignInWithEmailEvent(
        email: emailController.text, password: passwordController.text));
  }

  onGoogleSignInPressed() {
    authBloc.add(const AuthSignInWithGoogleEvent());
  }

  @override
  void initState() {
    super.initState();
    authBloc = GetIt.instance();
  }

  void navigateToSignUp(BuildContext context) {
    context.pushReplacementNamed(SignUpPage.routeName);
  }
}
