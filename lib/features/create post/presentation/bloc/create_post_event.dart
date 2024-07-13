part of 'create_post_bloc.dart';

abstract class CreatePostEvent extends Equatable {
  const CreatePostEvent();

  @override
  List<Object> get props => [];
}

class CreatePostSendPostEvent extends CreatePostEvent {
  final PostModel postModel;

  const CreatePostSendPostEvent({required this.postModel});
}
