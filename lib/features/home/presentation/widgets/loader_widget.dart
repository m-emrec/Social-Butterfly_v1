import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../bloc/home_bloc.dart';
import 'post_widget_skeleton.dart';

class LoaderWidget extends StatefulWidget {
  final int index;

  /// This widget calls [HomeUpdatePostListEvent] when it is built.
  const LoaderWidget({super.key, required this.index});

  @override
  State<LoaderWidget> createState() => _LoaderWidgetState();
}

class _LoaderWidgetState extends State<LoaderWidget> {
  @override
  void initState() {
    super.initState();
    final HomeBloc homeBloc = GetIt.instance<HomeBloc>();

    /// add [HomeUpdatePostListEvent] to [HomeBloc]
    homeBloc.add(HomeUpdatePostListEvent(widget.index));
  }

  @override
  Widget build(BuildContext context) {
    return const PostWidgetSkeleton();
  }
}
