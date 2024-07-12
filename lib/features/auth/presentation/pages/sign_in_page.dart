import 'package:flutter/material.dart';

import '../../../../core/constants/enums/icons_enum.dart';
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
      showForgotPassword: true,
      title: pageTitle,
      formKey: formKey,
      textButton: TextButton(
        onPressed: () {},
        child: Text(textButtonLabel),
      ),
      primaryButton: Row(
        children: [
          ExpandedElevatedButton(
            onPressed: () {},
            child: Text(primaryButtonLabel),
          ),
        ],
      ),
      googleButton: Row(
        children: [
          ExpandedOutlinedIconButton(
            onPressed: () {},
            label: Text(googleButtonLabel),
            icon: Image.asset(IconsEnum.googleSignIn.path),
          )
        ],
      ),
      emailController: emailController,
      passwordController: passwordController,
    );
  }
}
