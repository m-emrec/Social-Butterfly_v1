import '../../../../core/resources/injection_container.dart';
import '../../domain/repositories/home_repo.dart';
import '../../domain/usecases/fetch_post_data_usecase.dart';
import '../../presentation/bloc/home_bloc.dart';
import '../repositories/home_repo_impl.dart';
import 'home_firebase_connection.dart';

class HomeInjectionContainer extends InjectionContainer {
  @override
  Future<void> dispose() async {
    unRegister(HomeFirebaseConnection);
    unRegister(HomeRepo);
    unRegister(FetchPostDataUsecase);
    unRegister(HomeBloc);
  }

  @override
  Future<void> initialize() async {
    sl.allowReassignment = true;
    register<HomeFirebaseConnection>(HomeFirebaseConnection());
    register<HomeRepo>(HomeRepoImpl(firebaseConnection: sl()));

    register<FetchPostDataUsecase>(FetchPostDataUsecase(homeRepo: sl()));

    sl.registerFactory<HomeBloc>(() => HomeBloc(sl()));
  }
}
