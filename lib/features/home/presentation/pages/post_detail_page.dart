import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../core/constants/paddings.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utils/models/post_model.dart';
import '../widgets/post_body.dart';

class PostDetailPage extends StatelessWidget {
  final PostModel postModel;
  const PostDetailPage({super.key, required this.postModel});
  bool get _isPostWithImage => postModel.imageUrl != "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${postModel.publishedBy!}'s Post"),
      ),
      body: Padding(
        padding: AppPaddings.pageHPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image Container
            ImageWidget(
                isPostWithImage: _isPostWithImage, postModel: postModel),
            Gap(AppPaddings.smallPadding),

            /// Content
            Text(
              postModel.header ?? "",
              style: context.textTheme.titleMedium,
            ),

            /// Date Text
            Text(
              DateFormat.yMMMEd().format(postModel.createdDate!),
              style: context.textTheme.labelSmall
                  ?.copyWith(color: AppColors.darkTextColor.withOpacity(0.5)),
            ),

            /// Content
            Text(
              postModel.content ?? "",
              style: context.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
