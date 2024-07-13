import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/extensions/context_extension.dart';

class PostWidgetSkeleton extends StatelessWidget {
  const PostWidgetSkeleton({super.key});

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
              "Header",
              style: context.textTheme.titleMedium,
            ),
            // User name
            Text(
              "User name",
              style: context.textTheme.titleSmall,
            ),
            // date
            Text(
              "20/07/24",
              style: context.textTheme.labelSmall,
            ),
            // Content
            Text(
              "Lorem ipsum dolor sit amet consectetur. Vel vel purus lectus eu rutrum. Aliquet gravida lorem rhoncus laoreet mattis pretium eget integer cursus. Pulvinar ultrices enim nisi tellus neque justo id. Ultricies feugiat lacus pellentesque odio pretium ...Continue Reading",
              style: context.textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}
