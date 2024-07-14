import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/constants/paddings.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utils/mixins/loading_indicator_mixin.dart';
import '../../../../core/utils/models/post_model.dart';
import '../../../../core/utils/widgets/custom_snack_bar.dart';
import '../../data/datasources/home_injection_container.dart';
import '../bloc/home_bloc.dart';
import '../widgets/home_app_bar.dart';
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
    homeBloc.add(const HomeFetchDataEvent());
  }

  @override
  void dispose() {
    super.dispose();
    HomeInjectionContainer().dispose();
  }

  List<PostModel> postList = [];
  bool _isEnd = false;
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
                listener: (context, state) {
                  if (state is HomeSuccessState) {
                    postList = state.postModel;
                    setState(() {});
                  }
                  if (state is HomeUpdateListState) {
                    setState(() {
                      postList.addAll(state.postModel);
                    });
                  }
                  if (state is HomeEndOFListState) {
                    setState(() {
                      _isEnd = true;
                    });
                    context.showSnack(
                      SuccessSnack(
                        context,
                        text: "You seen all .",
                      ),
                    );
                  }
                },
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          ...postList.map(
                            (post) {
                              return PostBody(postModel: post);
                            },
                          ),
                          Visibility(
                            visible: !_isEnd,
                            child: LoaderWidget(
                              postList: postList,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))));
  }
}

class LoaderWidget extends StatefulWidget {
  final List<PostModel> postList;
  const LoaderWidget({super.key, required this.postList});

  @override
  State<LoaderWidget> createState() => _LoaderWidgetState();
}

class _LoaderWidgetState extends State<LoaderWidget> {
  late HomeBloc homeBloc;
  @override
  void initState() {
    super.initState();
    homeBloc = GetIt.instance<HomeBloc>();
    homeBloc.add(HomeUpdatePostListEvent(widget.postList));
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
