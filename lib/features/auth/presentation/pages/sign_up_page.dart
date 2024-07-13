import 'package:flutter/material.dart';
import 'package:social_butterfly/core/utils/mixins/email_validator_mixin.dart';

import '../../../../core/constants/enums/asset_enums.dart';
import '../../../../core/utils/widgets/buttons.dart';
import '../mixins/sign_up_mixin.dart';
import '../widgets/base_auth_page.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = "sign-up";
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
    with SignUpMixin, EmailValidatorMixin {
  @override
  Widget build(BuildContext context) {
    return BaseAuthPage(
      emailValidator: validateEmail,
      authBloc: authBloc,
      title: pageTitle,
      formKey: formKey,
      textButton: TextButton(
        onPressed: () => navigateToSignIn(context),
        child: Text(textButtonLabel),
      ),
      primaryButton: Row(
        children: [
          ExpandedElevatedButton(
            onPressed: onSignUpButtonPressed,
            child: Text(primaryButtonLabel),
          ),
        ],
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
