import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/paddings.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utils/mixins/loading_indicator_mixin.dart';
import '../../../../core/utils/widgets/buttons.dart';
import '../../../../core/utils/widgets/custom_form_field.dart';
import '../../../../core/utils/widgets/custom_snack_bar.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../bloc/create_post_bloc.dart';
import '../mixins/create_post_mixin.dart';
import '../widgets/image_container.dart';

class CreatePostPage extends StatefulWidget {
  static const routeName = "create-post";
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage>
    with CreatePostMixin, LoadingIndicatorMixin {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CreatePostBloc, CreatePostState>(
      bloc: createPostBloc,
      listener: (context, state) {
        switch (state) {
          case CreatePostLoadingState():
            showLoadingIndicator(context);
            break;
          case CreatePostSuccessState():
            disposeLoadingIndicator(context);
            context.pushReplacementNamed(HomePage.routeName);
            break;
          case CreatePostFailState():
            disposeLoadingIndicator(context);
            context.showSnack(
              ErrorSnack(
                context,
                text: state.errmsg,
              ),
            );
            break;

          default:
        }
      },
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        resizeToAvoidBottomInset: false,
        floatingActionButton: Padding(
          padding: AppPaddings.pageHPadding,

          /// post button
          child: Row(
            children: [
              ExpandedElevatedButton(
                onPressed: onPostButtonPressed,
                child: Text(buttonText),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(pageTitle),
        ),
        body: Padding(
          padding: AppPaddings.pageHPadding,
          child: SingleChildScrollView(
            child: Column(
              children: [
                /// Add Image Container
                AspectRatio(
                  aspectRatio: 16 / 12,
                  child: ImageContainer(imagePathController),
                ),
                Gap(AppPaddings.mediumPadding),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      /// Header Input
                      NormalTextFormField(
                        controller: headerController,
                        validator: headerValidator,
                      ),

                      /// Text Area
                      Gap(AppPaddings.mediumPadding),

                      NormalTextAreaFormField(
                        controller: contentController,
                        constraints: BoxConstraints(
                          maxHeight: context.screenSize.height * .2,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
