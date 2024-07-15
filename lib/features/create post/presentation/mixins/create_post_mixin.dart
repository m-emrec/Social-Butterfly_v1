import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/utils/models/post_model.dart';
import '../../data/datasources/create_post_injection_container.dart';
import '../bloc/create_post_bloc.dart';
import '../pages/create_post_page.dart';

mixin CreatePostMixin on State<CreatePostPage> {
  final TextEditingController headerController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController imagePathController = TextEditingController();
  final String buttonText = "Post";
  final String pageTitle = "Create Post";

  late CreatePostBloc createPostBloc;
  final GetIt sl = GetIt.instance;
  @override
  void initState() {
    CreatePostInjectionContainer().initialize();
    createPostBloc = sl<CreatePostBloc>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    headerController.dispose();
    contentController.dispose();
    imagePathController.dispose();
    CreatePostInjectionContainer().dispose();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? headerValidator(String? val) {
    if (val != null) {
      if (val.length >= 3) {
        return null;
      }
    }
    return "Header must be longer than 3 characters";
  }

  onPostButtonPressed() {
    if (formKey.currentState != null) {
      if (formKey.currentState!.validate()) {
        final PostModel postModel = PostModel(
          header: headerController.text,
          content: contentController.text,
          imageUrl: imagePathController.text,
        );

        createPostBloc.add(
          CreatePostSendPostEvent(postModel: postModel),
        );
      }
    }
  }
}
