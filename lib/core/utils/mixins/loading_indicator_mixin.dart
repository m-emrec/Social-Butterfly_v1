import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../../constants/enums/asset_enums.dart';
import '../../extensions/context_extension.dart';

mixin LoadingIndicatorMixin {
  showLoadingIndicator(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: RiveAnimation.asset(
            AssetsEnum.loadingAnimation.path,
          ),
        ),
      ),
    );
  }

  disposeLoadingIndicator(BuildContext context) {
    context.pop();
  }
}
