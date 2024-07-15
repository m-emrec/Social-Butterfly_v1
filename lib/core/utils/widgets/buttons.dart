import 'package:flutter/material.dart';

import '../../../config/theme/app_theme.dart';
import '../../constants/border_radius.dart';
import '../../constants/paddings.dart';

class ExpandedElevatedButton extends StatelessWidget {
  final void Function()? onPressed;

  final Widget child;

  /// Return an [ElevatedButton] wrapped in [Expanded] widget.
  /// If you want to make this button expand horizontally , wrapt it with [Row]
  /// ATTENTION : Do not use this widget without wrapping it with a [Row] or [Column]
  const ExpandedElevatedButton(
      {super.key, this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(onPressed: onPressed, child: child),
    );
  }
}

/// Outlined
class ExpandedOutlinedIconButton extends StatelessWidget {
  final void Function()? onPressed;

  final Widget label;
  final Widget? icon;

  /// Return an [OutlinedButton.icon] wrapped in [Expanded] widget.
  /// If you want to make this button expand horizontally , wrapt it with [Row]
  /// ATTENTION : Do not use this widget without wrapping it with a [Row] or [Column]
  const ExpandedOutlinedIconButton({
    super.key,
    this.onPressed,
    required this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton.icon(
        iconAlignment: IconAlignment.start,
        label: label,
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final Widget icon;

  final void Function()? onPressed;
  final bool isFilled;
  const CustomIconButton(
      {super.key,
      required this.icon,
      required this.onPressed,
      this.isFilled = true});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      style: IconButton.styleFrom(
        padding: EdgeInsets.all(
          AppPaddings.xsmallPadding,
        ),
        backgroundColor: isFilled ? AppColors.primaryColor : Colors.transparent,
        foregroundColor: AppColors.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.mediumBorderRadius,
        ),
      ),
      onPressed: onPressed,
      icon: icon,
    );
  }
}
