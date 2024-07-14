import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:social_butterfly/core/utils/models/post_model.dart';
import 'package:social_butterfly/logger.dart';
import '../../../../core/extensions/context_extension.dart';

import '../../../../core/constants/paddings.dart';
import '../../../../core/utils/widgets/buttons.dart';

class PostBody extends StatelessWidget {
  final String? publishedBy;

  final String? header;

  final String? createdDate;

  final String? content;
  final String? imageUrl;
  final PostModel postModel;
  const PostBody(
      {super.key,
      this.publishedBy,
      this.header,
      this.createdDate,
      this.content,
      this.imageUrl,
      required this.postModel});

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
                postModel.publishedBy ?? "",
                style: context.textTheme.titleSmall,
              ),
              // date
              Text(
                postModel.createdDate.toString(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
          // Image
          Visibility(
            visible: postModel.imageUrl != "",
            child: AspectRatio(
              aspectRatio: 16 / 12,
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  postModel.imageUrl ?? "",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Header
          Text(
            postModel.header ?? "",
            style: context.textTheme.titleMedium,
          ),

          // Content
          Text(
            postModel.content ?? "",
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
