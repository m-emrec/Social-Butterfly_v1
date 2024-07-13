import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../core/constants/enums/asset_enums.dart';
import '../../../../core/extensions/context_extension.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  final String socialText = "Social ";
  final String butterflyText = "Butterfly";
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title(context),
      leading: Image.asset(AssetsEnum.appLogoIcon.path),
      actions: [
        IconButton.filled(
          onPressed: () {},
          icon: Icon(
            Icons.add,
            color: AppColors.backgroundColor,
          ),
        )
      ],
    );
  }

  Text title(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: socialText,
        style: context.textTheme.titleLarge
            ?.copyWith(color: AppColors.primaryColor),
        children: [
          TextSpan(
            text: butterflyText,
            style: context.textTheme.titleLarge
                ?.copyWith(color: AppColors.secondaryColor),
          ),
        ],
      ),
    );
  }
}
