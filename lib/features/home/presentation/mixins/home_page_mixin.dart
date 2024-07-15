import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:social_butterfly/logger.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../core/constants/paddings.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utils/models/post_model.dart';
import '../../../../core/utils/widgets/custom_snack_bar.dart';
import '../../data/datasources/home_injection_container.dart';
import '../bloc/home_bloc.dart';
import '../pages/home_page.dart';
import '../pages/post_detail_page.dart';
import '../widgets/post_body.dart';

mixin HomePageMixin on State<HomePage> {
  late HomeBloc homeBloc;
  List<PostModel> postList = [];
  bool seenAll = false;

  ThemeData get theme => context.theme.copyWith(
        textTheme: context.textTheme.copyWith(
          titleSmall: TextStyle(color: AppColors.secondaryColor),
          labelSmall: TextStyle(
            color: AppColors.darkTextColor.withOpacity(0.5),
          ),
          bodySmall: TextStyle(
            color: AppColors.darkTextColor.withOpacity(0.75),
          ),
        ),
      );

  // ignore: non_constant_identifier_names
  Iterable<Widget> PostList() {
    return postList.map(
      (post) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: AppPaddings.largePadding),
          child: InkWell(
            onTap: () => navigateToPostDetail(post),
            child: PostBody(postModel: post),
          ),
        );
      },
    );
  }

  void navigateToPostDetail(PostModel post) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => PostDetailPage(postModel: post)),
    );
  }

  @override
  void initState() {
    super.initState();
    HomeInjectionContainer().initialize();
    homeBloc = GetIt.instance<HomeBloc>();
    homeBloc.add(const HomeFetchPostListEvent());
  }

  @override
  void dispose() {
    super.dispose();
    HomeInjectionContainer().dispose();
  }

  void blocListener(BuildContext context, state) {
    if (state is HomeSuccessState) {
      postList = state.listOfPostModel;
      setState(() {});
      logger.e(postList.length);
    }
    if (state is HomeUpdateListState) {
      setState(() {
        postList.add(state.listOfPostModel);
      });
    }
    if (state is HomeEndOFListState) {
      setState(() {
        seenAll = true;
      });
      context.showSnack(
        SuccessSnack(
          context,
          text: "You seen all .",
        ),
      );
    }
  }
}
