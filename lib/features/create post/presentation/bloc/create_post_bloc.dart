// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:social_butterfly/logger.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/resources/error_manager.dart';
import '../../../../core/utils/models/post_model.dart';

import '../../domain/usecases/create_post_usecase.dart';

part 'create_post_event.dart';
part 'create_post_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  final CreatePostUsecase _createPostUsecase;
  CreatePostBloc(
    this._createPostUsecase,
  ) : super(CreatePostInitial()) {
    on<CreatePostEvent>((event, emit) {});
    on<CreatePostSendPostEvent>(onCreatePostSendPostEvent);
  }

  FutureOr<void> onCreatePostSendPostEvent(
      CreatePostSendPostEvent event, Emitter<CreatePostState> emit) async {
    emit(CreatePostLoadingState());
    logger.d(event.postModel.toString());
    final DataState dataState = await _createPostUsecase.call(event.postModel);
    logger.i(dataState);
    if (dataState is DataSuccess) {
      emit(CreatePostSuccessState());
    } else {
      logger.e(dataState.exception);
      emit(
        CreatePostFailState(
          AppErrorText().errorMessage(dataState.exception),
        ),
      );
    }
  }
}
