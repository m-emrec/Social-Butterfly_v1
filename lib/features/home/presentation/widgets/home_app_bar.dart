import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../core/constants/enums/asset_enums.dart';
import '../../../../core/constants/paddings.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utils/widgets/buttons.dart';
import '../../../create%20post/presentation/pages/create_post_page.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  void _onCreatePostPressed(BuildContext context) {
    context.pushNamed(CreatePostPage.routeName);
  }

  final String socialText = "Social ";
  final String butterflyText = "Butterfly";
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title(context),
      leading: GestureDetector(
          onTap: () => FirebaseAuth.instance.signOut(),
          child: Image.asset(AssetsEnum.appLogoIcon.path)),
      actions: [
        // Create new post button.
        Padding(
          padding: EdgeInsets.only(right: AppPaddings.smallPadding),
          child: CustomIconButton(
            onPressed: () => _onCreatePostPressed(context),
            icon: Icon(
              Icons.add,
              color: AppColors.backgroundColor,
            ),
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
