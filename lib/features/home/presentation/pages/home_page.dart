import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../config/theme/app_theme.dart';

import '../../../../core/constants/paddings.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utils/mixins/loading_indicator_mixin.dart';
import '../../../../core/utils/models/post_model.dart';
import '../../../../core/utils/widgets/custom_snack_bar.dart';
import '../../data/datasources/home_injection_container.dart';
import '../bloc/home_bloc.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/loader_widget.dart';
import '../widgets/post_body.dart';

class HomePage extends StatefulWidget {
  static const routeName = "home-page";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with LoadingIndicatorMixin {
  late HomeBloc homeBloc;
  @override
  void initState() {
    super.initState();
    HomeInjectionContainer().initialize();
    homeBloc = GetIt.instance<HomeBloc>();
    homeBloc.add(const HomeFetchPostListEvent());
  }

  ThemeData get _theme => context.theme.copyWith(
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

  @override
  void dispose() {
    super.dispose();
    HomeInjectionContainer().dispose();
  }

  List<PostModel> postList = [];
  bool _seenAll = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: HomeAppBar(),
      ),
      body: Padding(
        padding: AppPaddings.pageHPadding,
        child: BlocListener<HomeBloc, HomeState>(
          bloc: homeBloc,
          listener: blocListener,
          child: Column(
            children: [
              Expanded(
                child: Theme(
                  data: _theme,
                  child: ListView(
                    children: [
                      ...PostList(),
                      Visibility(
                        visible: !_seenAll,
                        child: LoaderWidget(
                          postList: postList,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Iterable<Widget> PostList() {
    return postList.map(
      (post) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: AppPaddings.largePadding),
          child: PostBody(postModel: post),
        );
      },
    );
  }

  void blocListener(BuildContext context, state) {
    if (state is HomeSuccessState) {
      postList = state.listOfPostModel;
      setState(() {});
    }
    if (state is HomeUpdateListState) {
      setState(() {
        postList.addAll(state.listOfPostModel);
      });
    }
    if (state is HomeEndOFListState) {
      setState(() {
        _seenAll = true;
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
