import 'package:get_it/get_it.dart';

abstract class InjectionContainer {
  final GetIt _sl = GetIt.instance;

  GetIt get sl => _sl;

  /// initialize singletons
  Future<void> initialize();

  /// Dispose singletons
  Future<void> dispose();

  /// Check if the given Object is already registered
  bool isRegistered<T extends Object>(instance) =>
      sl.isRegistered<T>(instance: instance);

  /// Unregister the singleton if it is registered.
  Future<void> unRegister<T extends Object>(Object? object) async {
    final bool registered = isRegistered<T>(object);
    if (registered) await sl.unregister<T>(instance: object);
  }

  /// register Singleton if it is not registered.
  void register<T extends Object>(T object) {
    final bool registered = isRegistered(object);

    if (registered == false) sl.registerSingleton<T>(object);
  }

  /// register Factory if it is not registered.
  void registerF<T extends Object>(T object) {
    final bool registered = isRegistered(object);
    if (registered == false) sl.registerFactory<T>(() => object);
  }
}
