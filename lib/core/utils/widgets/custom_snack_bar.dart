import 'package:flutter/material.dart';
import '../../extensions/context_extension.dart';

abstract class Snack extends SnackBar {
  const Snack(
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

class ErrorSnack extends Snack {
  const ErrorSnack(
    super.context, {
    super.key,
    super.text,
  });
  @override
  Color? get backgroundColor => Colors.red.shade600;
}

class SuccessSnack extends Snack {
  const SuccessSnack(
    super.context, {
    super.key,
    super.text,
  });
  @override
  Color? get backgroundColor => Colors.green.shade600;
}
