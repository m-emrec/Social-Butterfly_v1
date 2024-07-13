import 'package:flutter/material.dart';

import 'post_widget_skeleton.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        // shrinkWrap: true,
        children: List.generate(
          3,
          (index) => const Column(
            children: [
              PostWidgetSkeleton(),
            ],
          ),
        ),
      ),
    );
  }
}
