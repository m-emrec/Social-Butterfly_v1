import 'package:social_butterfly/logger.dart';

import '../../../../core/resources/injection_container.dart';
import '../../domain/repositories/home_repo.dart';
import '../../domain/usecases/fetch_post_data_usecase.dart';
import '../../domain/usecases/update_list_of_post_data_usecase.dart';
import '../../presentation/bloc/home_bloc.dart';
import '../repositories/home_repo_impl.dart';
import 'home_firebase_connection.dart';

class HomeInjectionContainer extends InjectionContainer {
  @override
  Future<void> dispose() async {
    await sl.reset();
  }

  @override
  Future<void> initialize() async {
    try {
      register<HomeFirebaseConnection>(HomeFirebaseConnection());
      register<HomeRepo>(HomeRepoImpl(firebaseConnection: sl()));

      register<UpdateListOfPostDataUsecase>(UpdateListOfPostDataUsecase(sl()));
      register<FetchPostDataUsecase>(FetchPostDataUsecase(homeRepo: sl()));
      register<HomeBloc>(HomeBloc(sl(), sl()));
    } catch (e) {}
  }
}
