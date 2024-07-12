import '../../../../core/resources/injection_container.dart';
import '../../domain/repositories/auth_repo.dart';
import '../../domain/usecases/forgot_password_usecase.dart';
import '../../domain/usecases/sign_in_with_email_usecase.dart';
import '../../domain/usecases/sign_in_with_google.dart';
import '../../domain/usecases/sign_up_with_email_usecase.dart';
import '../../presentation/bloc/auth_bloc.dart';
import '../repositories/auth_repo_impl.dart';
import 'auth_firebase_connection.dart';

class AuthInjectionContainer extends InjectionContainer {
  @override
  Future<void> dispose() {
    throw UnimplementedError();
  }

  @override
  Future<void> initialize() async {
    register<AuthFirebaseConnection>(AuthFirebaseConnection());

    /// Register Repo
    register<AuthRepo>(AuthRepoImpl(authFirebaseConnection: sl()));

    /// Register Usecases
    register<SignUpWithEmailUsecase>(SignUpWithEmailUsecase(authRepo: sl()));
    register<ForgotPasswordUsecase>(ForgotPasswordUsecase(authRepo: sl()));
    register<SignInWithGoogle>(SignInWithGoogle(authRepo: sl()));
    register<SignInWithEmailUsecase>(SignInWithEmailUsecase(authRepo: sl()));

    /// Register Bloc
    register<AuthBloc>(AuthBloc(sl(), sl(), sl(), sl()));
  }
}
