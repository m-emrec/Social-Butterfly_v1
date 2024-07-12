import 'package:flutter/material.dart';
import '../../extensions/context_extension.dart';

mixin LoadingIndicatorMixin {
  showLoadingIndicator(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  disposeLoadingIndicator(BuildContext context) {
    context.pop();
  }
}
