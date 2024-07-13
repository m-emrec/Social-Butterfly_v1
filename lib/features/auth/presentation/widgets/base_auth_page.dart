// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:social_butterfly/config/theme/app_theme.dart';
import 'package:social_butterfly/core/constants/enums/asset_enums.dart';
import 'package:social_butterfly/core/extensions/context_extension.dart';
import 'package:social_butterfly/core/utils/mixins/loading_indicator_mixin.dart';
import 'package:social_butterfly/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:social_butterfly/features/auth/presentation/pages/forgot_password_page.dart';

import '../../../../core/constants/paddings.dart';
import '../../../../core/extensions/image_path_extension.dart';
import '../../../../core/utils/widgets/custom_form_field.dart';
import '../../../../core/utils/widgets/custom_snack_bar.dart';

class BaseAuthPage extends StatelessWidget with LoadingIndicatorMixin {
  const BaseAuthPage({
    super.key,
    required this.title,
    required this.formKey,
    this.showForgotPassword = false,
    required this.textButton,
    required this.primaryButton,
    required this.googleButton,
    required this.emailController,
    required this.passwordController,
    this.emailValidator,
    this.passwordValidator,
    required this.authBloc,
  });
  final String title;
  final GlobalKey<FormState> formKey;
  final bool showForgotPassword;
  final TextButton textButton;
  final Widget primaryButton;
  final Widget googleButton;

  final TextEditingController emailController;
  final TextEditingController passwordController;

  final String? Function(String?)? emailValidator;
  final String? Function(String?)? passwordValidator;

  final AuthBloc authBloc;

  Widget get divider => const Row(
        children: [
          Expanded(child: Divider()),
          Text("OR"),
          Expanded(child: Divider()),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      bloc: authBloc,
      listener: (context, state) {
        switch (state) {
          case AuthSuccessState():
            disposeLoadingIndicator(context);
            context.pushReplacementNamed("/");
            break;
          case AuthFailState():
            disposeLoadingIndicator(context);
            context.showSnack(
              ErrorSnack(
                context,
                text: state.errmsg,
              ),
            );
            break;
          case AuthLoadingState():
            showLoadingIndicator(context);
            break;
          default:
        }
      },
      child: Scaffold(
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
                AssetsEnum.authBackgroundImage.path,
              ),
            ),
          ),
          child: Padding(
            padding: AppPaddings.pageHPadding,
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
                        validator: emailValidator,
                      ),
                      // gap
                      Gap(AppPaddings.mediumPadding),
                      // password field
                      PasswordField(
                        validator: passwordValidator,
                        controller: passwordController,
                        helper: showForgotPassword
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () => context.pushNamed(
                                        ForgotPasswordPage.routeName),
                                    child: Text(
                                      "Forgot Password",
                                      style: context.textTheme.labelSmall
                                          ?.copyWith(
                                        color: AppColors.secondaryColor
                                            .withOpacity(0.75),
                                      ),
                                    ),
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
      ),
    );
  }
}
