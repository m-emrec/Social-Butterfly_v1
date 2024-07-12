// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/paddings.dart';
import '../../../../core/extensions/image_path_extension.dart';
import '../../../../core/utils/widgets/custom_form_field.dart';

class BaseAuthPage extends StatelessWidget {
  const BaseAuthPage({
    Key? key,
    required this.title,
    required this.formKey,
    this.showForgotPassword = false,
    required this.textButton,
    required this.primaryButton,
    required this.googleButton,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);
  final String title;
  final GlobalKey<FormState> formKey;
  final bool showForgotPassword;
  final TextButton textButton;
  final Widget primaryButton;
  final Widget googleButton;

  final TextEditingController emailController;
  final TextEditingController passwordController;

  Widget get divider => const Row(
        children: [
          Expanded(child: Divider()),
          Text("OR"),
          Expanded(child: Divider()),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(title),
      ),
      extendBodyBehindAppBar: true,
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              "auth_bg_image".toPngImage,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(AppPaddings.mediumPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Form Field
              Form(
                key: formKey,
                child: Column(
                  children: [
                    /// email fields
                    EmailField(
                      controller: emailController,
                    ),
                    // gap
                    Gap(AppPaddings.mediumPadding),
                    // password field
                    PasswordField(
                      controller: passwordController,
                      helper: showForgotPassword
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: const Text("Forgot Password"),
                                ),
                              ],
                            )
                          : null,
                    ),
                  ],
                ),
              ),
              Gap(AppPaddings.smallPadding),

              /// Text Button
              textButton,

              Gap(AppPaddings.smallPadding),

              /// Sign In button
              primaryButton,
              Gap(AppPaddings.largePadding),

              /// Divider
              divider,
              Gap(AppPaddings.largePadding),

              /// Google Sign In button
              googleButton,
            ],
          ),
        ),
      ),
    );
  }
}
