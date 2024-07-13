part of 'create_post_bloc.dart';

abstract class CreatePostState extends Equatable {
  const CreatePostState();

  @override
  List<Object> get props => [];
}

class CreatePostInitial extends CreatePostState {}

class CreatePostLoadingState extends CreatePostState {}

class CreatePostSuccessState extends CreatePostState {}

class CreatePostFailState extends CreatePostState {
  final String? errmsg;

  const CreatePostFailState(this.errmsg);
}
