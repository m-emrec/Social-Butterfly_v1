import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:social_butterfly/features/home/presentation/bloc/home_bloc.dart';
import 'package:social_butterfly/logger.dart';

import '../../../../core/constants/paddings.dart';
import '../../../../core/utils/mixins/loading_indicator_mixin.dart';
import '../../data/datasources/home_injection_container.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/post_widget.dart';

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
  }

  @override
  void dispose() {
    super.dispose();
    HomeInjectionContainer().dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: HomeAppBar(),
      ),
      body: Padding(
        padding: AppPaddings.pageHPadding,
        child: Column(
          children: [
            Expanded(
              child: BlocProvider(
                create: (context) => homeBloc,
                child: ListView.builder(
                  itemCount: homeBloc.postIndex,
                  itemBuilder: (context, index) {
                    logger.e(homeBloc.postIndex);
                    return PostWidget(
                      index: index,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
