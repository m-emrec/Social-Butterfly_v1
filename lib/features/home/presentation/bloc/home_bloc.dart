import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:social_butterfly/core/resources/data_state.dart';
import 'package:social_butterfly/core/utils/models/post_model.dart';
import 'package:social_butterfly/logger.dart';
import '../../domain/usecases/fetch_post_data_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int postIndex = 3;
  final FetchPostDataUsecase _fetchPostDataUsecase;
  HomeBloc(this._fetchPostDataUsecase) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<HomeFetchDataEvent>(onHomeFetchDataEvent);
  }

  FutureOr<void> onHomeFetchDataEvent(
      HomeFetchDataEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    final DataState dataState = await _fetchPostDataUsecase.call(event.index);
    if (dataState is DataSuccess) {
      postIndex++;
      emit(HomeSuccessState(postModel: dataState.data));
    } else {
      logger.e(dataState.exception);
      emit(HomeFailState(dataState.exception));
    }
  }
}
