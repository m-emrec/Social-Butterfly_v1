import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:social_butterfly/core/resources/data_state.dart';
import 'package:social_butterfly/core/utils/models/post_model.dart';
import 'package:social_butterfly/features/home/domain/usecases/update_list_of_post_data_usecase.dart';
import 'package:social_butterfly/logger.dart';
import '../../domain/usecases/fetch_post_data_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int postIndex = 3;
  final FetchPostDataUsecase _fetchPostDataUsecase;
  final UpdateListOfPostDataUsecase _updateListOfPostDataUsecase;
  HomeBloc(this._fetchPostDataUsecase, this._updateListOfPostDataUsecase)
      : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<HomeFetchDataEvent>(onHomeFetchDataEvent);
    on<HomeUpdatePostListEvent>(onHomeUpdatePostListEvent);
  }

  FutureOr<void> onHomeFetchDataEvent(
      HomeFetchDataEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    final DataState dataState = await _fetchPostDataUsecase.call(null);
    if (dataState is DataSuccess) {
      emit(HomeSuccessState(postModel: dataState.data));
    } else {
      logger.e(dataState.exception);
      emit(HomeFailState(dataState.exception));
    }
  }

  FutureOr<void> onHomeUpdatePostListEvent(
      HomeUpdatePostListEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    final DataState dataState =
        await _updateListOfPostDataUsecase.call(event.postList);
    if (dataState is DataSuccess) {
      if (dataState.data == null) {
        emit(HomeEndOFListState());
      } else {
        emit(HomeUpdateListState(dataState.data));
      }
    } else {
      logger.e(dataState.exception);
      emit(HomeFailState(dataState.exception));
    }
  }
}
