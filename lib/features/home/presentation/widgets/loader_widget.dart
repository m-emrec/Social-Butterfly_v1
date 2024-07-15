import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../bloc/home_bloc.dart';
import 'post_widget_skeleton.dart';

class LoaderWidget extends StatefulWidget {
  final int index;
  final HomeBloc homeBloc;

  /// This widget calls [HomeUpdatePostListEvent] when it is built.
  const LoaderWidget({super.key, required this.index, required this.homeBloc});

  @override
  State<LoaderWidget> createState() => _LoaderWidgetState();
}

class _LoaderWidgetState extends State<LoaderWidget> {
  @override
  void initState() {
    /// add [HomeUpdatePostListEvent] to [HomeBloc]
    widget.homeBloc.add(HomeUpdatePostListEvent(widget.index));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const PostWidgetSkeleton();
  }
}
