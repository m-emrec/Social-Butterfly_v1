part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeFetchPostListEvent extends HomeEvent {
  const HomeFetchPostListEvent();
}

class HomeUpdatePostListEvent extends HomeEvent {
  final List<PostModel> postList;
  const HomeUpdatePostListEvent(this.postList);
}
