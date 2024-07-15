import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/resources/error_manager.dart';
import '../../../../logger.dart';
import '../../data/models/credentials_model.dart';
import '../../domain/usecases/forgot_password_usecase.dart';
import '../../domain/usecases/sign_in_with_email_usecase.dart';
import '../../domain/usecases/sign_in_with_google.dart';
import '../../domain/usecases/sign_up_with_email_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ForgotPasswordUsecase _forgotPasswordUsecase;
  final SignInWithEmailUsecase _signInWithEmailUsecase;
  final SignInWithGoogle _signInWithGoogle;
  final SignUpWithEmailUsecase _signUpWithEmailUsecase;
  AuthBloc(this._forgotPasswordUsecase, this._signInWithEmailUsecase,
      this._signInWithGoogle, this._signUpWithEmailUsecase)
      : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<AuthForgotPasswordEvent>(onAuthForgotPasswordEvent);
    on<AuthSignInWithEmailEvent>(onAuthSignInWithEmailEvent);
    on<AuthSignInWithGoogleEvent>(onAuthSignInWithGoogleEvent);
    on<AuthSignUpWithEmailEvent>(onAuthSignUpWithEmailEvent);
  }

  FutureOr<void> onAuthForgotPasswordEvent(
      AuthForgotPasswordEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());

    final DataState dataState = await _forgotPasswordUsecase.call(event.email);
    checkDataState(dataState, emit);
  }

  FutureOr<void> onAuthSignInWithEmailEvent(
      AuthSignInWithEmailEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    CredentialsModel credentials =
        CredentialsModel(email: event.email, password: event.password);

    final DataState dataState = await _signInWithEmailUsecase.call(credentials);
    checkDataState(dataState, emit);
  }

  FutureOr<void> onAuthSignInWithGoogleEvent(
      AuthSignInWithGoogleEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final DataState dataState = await _signInWithGoogle.call(null);
    checkDataState(dataState, emit);
  }

  FutureOr<void> onAuthSignUpWithEmailEvent(
      AuthSignUpWithEmailEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    CredentialsModel credentials = CredentialsModel(
        email: event.email, password: event.password, userName: event.userName);
    final DataState dataState = await _signUpWithEmailUsecase.call(credentials);
    checkDataState(dataState, emit);
  }

  /// this functions receives a [DataState] and check if it is [DataSuccess] or [DataFailed]
  /// if [DataSuccess] it returns [AuthSuccessState]
  /// if not [DataSuccess] it returns [AuthFailState] and the error.
  checkDataState(DataState dataState, Emitter<AuthState> emit) async {
    if (dataState is DataSuccess) {
      emit(AuthSuccessState());
    } else {
      logger.e(dataState.exception);
      emit(
        AuthFailState(
          errmsg: AppErrorText().errorMessage(dataState.exception),
        ),
      );
    }
  }
}
