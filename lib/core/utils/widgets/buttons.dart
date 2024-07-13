import 'package:flutter/material.dart';

import '../../constants/enums/asset_enums.dart';

class ExpandedElevatedButton extends StatelessWidget {
  final void Function()? onPressed;

  final Widget child;

  const ExpandedElevatedButton(
      {super.key, this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(onPressed: onPressed, child: child),
    );
  }
}

/// Elevated

/// Outlined
class ExpandedOutlinedIconButton extends StatelessWidget {
  final void Function()? onPressed;

  final Widget label;
  final Widget? icon;

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

/// Text