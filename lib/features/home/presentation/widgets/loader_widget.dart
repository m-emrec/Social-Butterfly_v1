import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/utils/models/post_model.dart';
import '../bloc/home_bloc.dart';
import 'post_widget_skeleton.dart';

class LoaderWidget extends StatefulWidget {
  final List<PostModel> postList;

  /// This widget calls [HomeUpdatePostListEvent] when it is built.
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

    /// add [HomeUpdatePostListEvent] to [HomeBloc]
    homeBloc.add(HomeUpdatePostListEvent(widget.postList));
  }

  @override
  Widget build(BuildContext context) {
    return const PostWidgetSkeleton();
  }
}
