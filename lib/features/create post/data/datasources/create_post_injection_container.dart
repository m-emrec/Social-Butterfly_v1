import '../repositories/create_post_repo_impl.dart';
import '../../presentation/bloc/create_post_bloc.dart';

import '../../../../core/resources/injection_container.dart';
import '../../domain/repositories/create_post_repo.dart';
import '../../domain/usecases/create_post_usecase.dart';
import 'create_post_firebase_connection.dart';

class CreatePostInjectionContainer extends InjectionContainer {
  @override
  Future<void> dispose() {
    // TODO: implement dispose
    throw UnimplementedError();
  }

  @override
  Future<void> initialize() async {
    register<CreatePostFirebaseConnection>(CreatePostFirebaseConnection());

    register<CreatePostRepo>(
        CreatePostRepoImpl(createPostFirebaseConnection: sl()));

    register<CreatePostUsecase>(CreatePostUsecase(createPostRepo: sl()));

    register<CreatePostBloc>(CreatePostBloc(sl()));
  }
}
