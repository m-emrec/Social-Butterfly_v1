import 'package:social_butterfly/features/home/domain/usecases/update_list_of_post_data_usecase.dart';

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

    register<UpdateListOfPostDataUsecase>(UpdateListOfPostDataUsecase(sl()));
    register<FetchPostDataUsecase>(FetchPostDataUsecase(homeRepo: sl()));
    register<HomeBloc>(HomeBloc(sl(), sl()));
  }
}
