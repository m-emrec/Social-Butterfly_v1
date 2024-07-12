import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/paddings.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utils/mixins/email_validator_mixin.dart';
import '../../../../core/utils/mixins/loading_indicator_mixin.dart';
import '../../../../core/utils/widgets/buttons.dart';
import '../../../../core/utils/widgets/custom_form_field.dart';
import '../../../../core/utils/widgets/custom_snack_bar.dart';
import '../bloc/auth_bloc.dart';
import '../mixins/forgot_password_mixin.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const routeName = "forgot-password";
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>
    with EmailValidatorMixin, ForgotPasswordMixin, LoadingIndicatorMixin {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      bloc: authBloc,
      listener: (context, state) {
        switch (state) {
          case AuthSuccessState():
            disposeLoadingIndicator(context);
            // context.pushReplacementNamed(SignInPage.routeName);

            context.showSnack(
              SuccessSnack(
                context,
                text: successMssg,
              ),
            );
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
        appBar: AppBar(
          title: Text(
            forgotPassword,
          ),
        ),
        body: Padding(
          padding: AppPaddings.pageHPadding,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EmailField(
                  controller: emailController,
                  validator: validateEmail,
                ),
                MaxGap(AppPaddings.largePadding),
                Row(
                  children: [
                    ExpandedElevatedButton(
                      onPressed: onForgotPasswordButtonPressed,
                      child: Text(
                        buttonText,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
