import 'package:flutter/material.dart';
import 'package:social_butterfly/config/theme/app_theme.dart';
import '../../extensions/context_extension.dart';

abstract class _Snack extends SnackBar {
  const _Snack(
    this.context, {
    this.text,
    super.key,
    super.content = const SizedBox(),
  });
  final BuildContext context;
  final String? text;
  @override
  Widget get content => Text(
        text ?? "",
        style: context.textTheme.labelMedium?.copyWith(
          color: Colors.white,
        ),
      );
  @override
  SnackBarBehavior? get behavior => SnackBarBehavior.floating;
  @override
  DismissDirection get dismissDirection => DismissDirection.horizontal;
}

class ErrorSnack extends _Snack {
  const ErrorSnack(
    super.context, {
    super.key,
    super.text,
  });
  @override
  Color? get backgroundColor => AppColors.errorColor;
}

class SuccessSnack extends _Snack {
  const SuccessSnack(
    super.context, {
    super.key,
    super.text,
  });
  @override
  Color? get backgroundColor => AppColors.successColor;
}
