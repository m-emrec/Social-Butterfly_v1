import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:social_butterfly/logger.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/models/post_model.dart';
import '../../domain/usecases/fetch_post_data_usecase.dart';
import '../../domain/usecases/update_list_of_post_data_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int postIndex = 3;
  final FetchPostDataUsecase _fetchPostDataUsecase;
  final UpdateListOfPostDataUsecase _updateListOfPostDataUsecase;
  HomeBloc(this._fetchPostDataUsecase, this._updateListOfPostDataUsecase)
      : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<HomeFetchPostListEvent>(onHomeFetchPostListEvent);
    on<HomeUpdatePostListEvent>(onHomeUpdatePostListEvent);
  }

  FutureOr<void> onHomeFetchPostListEvent(
      HomeFetchPostListEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    final DataState dataState = await _fetchPostDataUsecase.call(null);

    if (dataState is DataSuccess) {
      emit(HomeSuccessState(listOfPostModel: dataState.data));
    } else {
      emit(HomeFailState(dataState.exception));
    }
  }

  FutureOr<void> onHomeUpdatePostListEvent(
      HomeUpdatePostListEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    final DataState dataState =
        await _updateListOfPostDataUsecase.call(event.postList);

    if (dataState is DataSuccess) {
      /// if dataState.data is null that means there is no more post to see.
      if (dataState.data == null) {
        emit(const HomeEndOFListState());
      } else {
        emit(HomeUpdateListState(dataState.data));
      }
    } else {
      emit(HomeFailState(dataState.exception));
    }
  }
}
