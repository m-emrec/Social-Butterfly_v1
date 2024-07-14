import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../core/extensions/context_extension.dart';

import '../../../../core/constants/paddings.dart';
import '../../../../core/utils/widgets/buttons.dart';

class PostBody extends StatelessWidget {
  final String? publishedBy;

  final String? header;

  final String? createdDate;

  final String? content;
  final String? imageUrl;

  const PostBody(
      {super.key,
      this.publishedBy,
      this.header,
      this.createdDate,
      this.content,
      this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // User name
              Text(
                publishedBy ?? "",
                style: context.textTheme.titleSmall,
              ),
              // date
              Text(
                createdDate.toString(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
          // Image
          Visibility(
            visible: imageUrl != "",
            child: AspectRatio(
              aspectRatio: 16 / 12,
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  imageUrl ?? "",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Header
          Text(
            header ?? "",
            style: context.textTheme.titleMedium,
          ),

          // Content
          Text(
            content ?? "",
            style: context.textTheme.bodySmall,
          ),
          Gap(AppPaddings.xxsmallPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomIconButton(
                onPressed: () => {},
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
    );
  }
}
