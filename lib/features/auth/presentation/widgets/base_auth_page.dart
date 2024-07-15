import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../core/constants/enums/asset_enums.dart';
import '../../../../core/constants/paddings.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utils/mixins/loading_indicator_mixin.dart';
import '../../../../core/utils/widgets/custom_form_field.dart';
import '../../../../core/utils/widgets/custom_snack_bar.dart';
import '../bloc/auth_bloc.dart';
import '../mixins/base_auth_page_mixin.dart';
import '../pages/forgot_password_page.dart';

class BaseAuthPage extends StatefulWidget {
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
    this.nameController,
    this.showNameField = false,
    this.nameValidator,
  });
  final String title;
  final GlobalKey<FormState> formKey;
  final bool showForgotPassword;
  final TextButton textButton;
  final Widget primaryButton;
  final Widget googleButton;

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController? nameController;

  final String? Function(String?)? emailValidator;
  final String? Function(String?)? passwordValidator;
  final String? Function(String?)? nameValidator;

  final bool showNameField;
  final AuthBloc authBloc;

  @override
  State<BaseAuthPage> createState() => _BaseAuthPageState();
}

class _BaseAuthPageState extends State<BaseAuthPage>
    with LoadingIndicatorMixin, BaseAuthPageMixin {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      bloc: widget.authBloc,
      listener: blocListener,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(widget.title),
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
                  key: widget.formKey,
                  child: Column(
                    children: [
                      Visibility(
                        visible: widget.showNameField,
                        child: NormalTextFormField(
                          controller: widget.nameController,
                          label: "User name",
                          validator: widget.nameValidator,
                        ),
                      ),
                      Gap(AppPaddings.mediumPadding),

                      /// email field
                      EmailField(
                        controller: widget.emailController,
                        validator: widget.emailValidator,
                      ),
                      // gap
                      Gap(AppPaddings.mediumPadding),
                      // password field
                      PasswordField(
                        validator: widget.passwordValidator,
                        controller: widget.passwordController,
                        helper: widget.showForgotPassword
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
                widget.textButton,

                Gap(AppPaddings.smallPadding),

                /// Sign In button
                widget.primaryButton,
                Gap(AppPaddings.largePadding),

                /// Divider
                divider,
                Gap(AppPaddings.largePadding),

                /// Google Sign In button
                widget.googleButton,
              ],
            ),
          ),
        ),
      ),
    );
  }

  void blocListener(BuildContext context, state) {
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
  }
}
