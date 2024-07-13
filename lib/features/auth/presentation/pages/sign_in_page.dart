import 'package:flutter/material.dart';

import '../../../../core/constants/enums/asset_enums.dart';
import '../../../../core/utils/widgets/buttons.dart';
import '../mixins/sign_in_mixin.dart';
import '../widgets/base_auth_page.dart';

class SignInPage extends StatefulWidget {
  static String routeName = "sign-in";
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with SignInMixin {
  @override
  Widget build(BuildContext context) {
    return BaseAuthPage(
      authBloc: authBloc,
      showForgotPassword: true,
      title: pageTitle,
      formKey: formKey,

      /// Sign In button
      primaryButton: Row(
        children: [
          ExpandedElevatedButton(
            onPressed: onSignInButtonPressed,
            child: Text(primaryButtonLabel),
          ),
        ],
      ),
      textButton: TextButton(
        onPressed: () => navigateToSignUp(context),
        child: Text(textButtonLabel),
      ),
      googleButton: Row(
        children: [
          ExpandedOutlinedIconButton(
            onPressed: onGoogleSignInPressed,
            label: Text(googleButtonLabel),
            icon: Image.asset(AssetsEnum.googleSignIn.path),
          )
        ],
      ),
      emailController: emailController,
      passwordController: passwordController,
    );
  }
}
