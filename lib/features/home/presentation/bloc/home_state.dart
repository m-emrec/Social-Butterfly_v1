part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<PostModel> listOfPostModel;

  const HomeSuccessState({required this.listOfPostModel});
}

class HomeFailState extends HomeState {
  final String? errmsg;

  const HomeFailState(this.errmsg);
}

class HomeUpdateListState extends HomeState {
  final PostModel listOfPostModel;

  const HomeUpdateListState(this.listOfPostModel);
}

class HomeEndOFListState extends HomeState {
  const HomeEndOFListState();
}
