// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:social_butterfly/core/extensions/context_extension.dart';
import 'package:social_butterfly/logger.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../core/utils/models/post_model.dart';
import '../bloc/home_bloc.dart';
import 'post_body.dart';
import 'post_widget_skeleton.dart';

class PostWidget extends StatefulWidget {
  final int index;
  const PostWidget({super.key, required this.index});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  late HomeBloc homeBloc;
  @override
  void initState() {
    homeBloc = GetIt.instance<HomeBloc>();
    homeBloc.add(HomeFetchDataEvent(widget.index));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: homeBloc,
      builder: (context, state) {
        if (state is HomeSuccessState) {
          return _LoadedPostWidget(post: state.postModel);
        }
        if (state is HomeLoadingState) {
          return const _LoadingPostWidget();
        }

        return Container();
      },
    );
  }
}

class _LoadedPostWidget extends StatelessWidget {
  const _LoadedPostWidget({
    required this.post,
  });
  final PostModel post;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: context.theme.copyWith(
        textTheme: context.textTheme.copyWith(
          titleSmall: TextStyle(color: AppColors.secondaryColor),
          labelSmall: TextStyle(
            color: AppColors.darkTextColor.withOpacity(0.5),
          ),
          bodySmall: TextStyle(
            color: AppColors.darkTextColor.withOpacity(0.75),
          ),
        ),
      ),
      child: PostBody(
        publishedBy: post.publishedBy,
        header: post.header,
        createdDate: post.createdDate.toString(),
        imageUrl: post.imageUrl,
        content: post.content,
      ),
    );
  }
}

class _LoadingPostWidget extends StatelessWidget {
  const _LoadingPostWidget();

  @override
  Widget build(BuildContext context) {
    return const PostWidgetSkeleton();
  }
}
