import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/paddings.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utils/models/post_model.dart';
import '../../../../core/utils/widgets/buttons.dart';

class PostBody extends StatelessWidget {
  final PostModel postModel;
  const PostBody({super.key, required this.postModel});

  bool get _isPostWithImage => postModel.imageUrl != "";

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TopRow(postModel: postModel),
          // Image
          _ImageWidget(isPostWithImage: _isPostWithImage, postModel: postModel),
          // Header
          Text(
            postModel.header ?? "",
            style: context.textTheme.titleMedium,
          ),
          Gap(AppPaddings.xxsmallPadding),
          // Content
          Text(
            postModel.content ?? "",
            style: context.textTheme.bodySmall,
          ),
          Gap(AppPaddings.xxsmallPadding),
          const _ButtonRow(),
        ],
      ),
    );
  }
}

class _ButtonRow extends StatelessWidget {
  const _ButtonRow();

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget({
    required bool isPostWithImage,
    required this.postModel,
  }) : _isPostWithImage = isPostWithImage;

  final bool _isPostWithImage;
  final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isPostWithImage,
      child: AspectRatio(
        aspectRatio: 16 / 16,
        child: Card(
          margin: EdgeInsets.zero,
          child: Image.network(
            postModel.imageUrl!,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) =>
                loadingProgress == null
                    ? child
                    : const Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}

class _TopRow extends StatelessWidget {
  /// This row contains Username and Date
  const _TopRow({
    required this.postModel,
  });

  final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // User name
        Text(
          postModel.publishedBy ?? "",
          style: context.textTheme.titleSmall,
        ),
        // date
        Text(
          DateFormat.yMMMEd().format(postModel.createdDate!),
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
