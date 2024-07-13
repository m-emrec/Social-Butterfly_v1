import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/constants/paddings.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utils/models/post_model.dart';
import '../../../../core/utils/widgets/buttons.dart';

class PostWidgetSkeleton extends StatelessWidget {
  const PostWidgetSkeleton({super.key});

  PostModel get _DUMMY_POST => PostModel(
        id: "",
        commentCount: 0,
        content:
            "Lorem ipsum dolor sit amet consectetur. Vel vel purus lectus eu rutrum. Aliquet gravida lorem rhoncus laoreet mattis pretium eget integer cursus. Pulvinar ultrices enim nisi tellus neque justo id. Ultricies feugiat lacus pellentesque odio pretium ...Continue Reading",
        createdDate: DateTime.now(),
        header: "Header",
        likeCount: 0,
        publishedBy: "User",
      );

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            const Skeleton.leaf(
              child: AspectRatio(
                aspectRatio: 16 / 12,
                child: Card(),
              ),
            ),
            // Header
            Text(
              _DUMMY_POST.header!,
              style: context.textTheme.titleMedium,
            ),
            // User name
            Text(
              _DUMMY_POST.publishedBy!,
              style: context.textTheme.titleSmall,
            ),
            // date
            Text(
              _DUMMY_POST.createdDate.toString(),
              style: context.textTheme.labelSmall,
            ),
            // Content
            Text(
              _DUMMY_POST.content!,
              style: context.textTheme.bodySmall,
            ),
            Gap(AppPaddings.xsmallPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomIconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.abc),
                ),
                Gap(AppPaddings.mediumPadding),
                CustomIconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.abc),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
