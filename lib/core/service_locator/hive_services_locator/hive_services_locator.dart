

import 'package:get_it/get_it.dart';

import '../../local_storage/local_storage.dart';

class HiveServiceLocator {
  static Future<void> init({required GetIt getIt}) async {

    getIt.registerLazySingleton<HiveServiceImpl>(
          () => HiveServiceImpl.instance,
    );
    getIt.registerLazySingleton<IUserCache>(()=> HiveServiceImpl.instance);
    getIt.registerLazySingleton<ITokenCache>(() => HiveServiceImpl.instance);
  }}