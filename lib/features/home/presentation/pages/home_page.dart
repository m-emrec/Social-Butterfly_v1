import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/constants/paddings.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utils/mixins/loading_indicator_mixin.dart';
import '../../../../core/utils/widgets/custom_snack_bar.dart';
import '../../data/datasources/home_injection_container.dart';
import '../bloc/home_bloc.dart';
import '../mixins/home_page_mixin.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/loader_widget.dart';
import '../widgets/post_body.dart';

class HomePage extends StatefulWidget {
  static const routeName = "home-page";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with LoadingIndicatorMixin, HomePageMixin {
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
                  data: theme,
                  child: ListView(
                    children: [
                      ...PostList(),
                      Visibility(
                        visible: !seenAll,
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
}
