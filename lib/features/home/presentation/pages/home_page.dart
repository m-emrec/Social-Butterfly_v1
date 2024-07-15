import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/paddings.dart';
import '../../../../core/utils/mixins/loading_indicator_mixin.dart';
import '../bloc/home_bloc.dart';
import '../mixins/home_page_mixin.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/loader_widget.dart';

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: HomeAppBar(
          onPressed: () => onCreatePostPressed(context),
        ),
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
                          index: index,
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
