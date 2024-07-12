import 'package:flutter/material.dart';

import '../../../../core/constants/enums/icons_enum.dart';
import '../../../../core/utils/widgets/buttons.dart';
import '../mixins/sign_up_mixin.dart';
import '../widgets/base_auth_page.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = "sign-up";
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with SignUpMixin {
  @override
  Widget build(BuildContext context) {
    return BaseAuthPage(
      title: pageTitle,
      formKey: formKey,
      textButton: TextButton(
        onPressed: () => navigateToSignIn(context),
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
