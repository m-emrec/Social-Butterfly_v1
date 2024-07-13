import 'package:flutter/material.dart';
import '../../../../core/constants/paddings.dart';
import '../../../../core/utils/mixins/loading_indicator_mixin.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/loading_widget.dart';

class HomePage extends StatefulWidget {
  static const routeName = "home-page";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with LoadingIndicatorMixin, SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
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
        child: const Column(
          children: [
            LoadingWidget(),
          ],
        ),
      ),
    );
  }
}
