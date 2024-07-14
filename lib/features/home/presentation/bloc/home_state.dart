part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<PostModel> postModel;

  const HomeSuccessState({required this.postModel});
}

class HomeFailState extends HomeState {
  final String? errmsg;

  const HomeFailState(this.errmsg);
}

class HomeUpdateListState extends HomeActionState {
  final List<PostModel> postModel;

  HomeUpdateListState(this.postModel);
}

class HomeEndOFListState extends HomeActionState {
  HomeEndOFListState();
}
