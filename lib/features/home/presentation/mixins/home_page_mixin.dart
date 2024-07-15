import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../core/constants/paddings.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utils/models/post_model.dart';
import '../../../../core/utils/widgets/custom_snack_bar.dart';
import '../../../create post/presentation/pages/create_post_page.dart';
import '../../data/datasources/home_injection_container.dart';
import '../bloc/home_bloc.dart';
import '../pages/home_page.dart';
import '../pages/post_detail_page.dart';
import '../widgets/post_body.dart';

mixin HomePageMixin on State<HomePage> {
  late HomeBloc homeBloc;
  late List<PostModel> postList;
  late bool seenAll;
  late int index;

  /// I used different theme for some of the properties , because of that I override
  /// some of the theme properties here.
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

  /// Return a list of [PostBody] wrapped in an [Inkwell]
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
    HomeInjectionContainer().initialize();
    homeBloc = GetIt.instance<HomeBloc>();
    homeBloc.add(const HomeFetchPostListEvent());
    seenAll = false;
    postList = [];
    index = 0;
    super.initState();
  }

  void onCreatePostPressed(BuildContext context) async {
    await HomeInjectionContainer().dispose();
    context.pushNamed(CreatePostPage.routeName);
  }

  void blocListener(BuildContext context, state) {
    if (state is HomeSuccessState) {
      postList.addAll(state.listOfPostModel);
      index = postList.length;

      setState(() {});
    }
    if (state is HomeUpdateListState) {
      index = postList.length + 1;

      postList.add(state.postModel);

      setState(() {});
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
