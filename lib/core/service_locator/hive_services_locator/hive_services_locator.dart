

import 'package:get_it/get_it.dart';

import '../../../features/home/restaurants/models/restaurant_model.dart';
import '../../../features/home/jeebly_eat/model/search_restaurant_model.dart';
import '../../local_storage/local_storage.dart';

class HiveServiceLocator {
  static Future<void> init({required GetIt getIt}) async {
    await HiveServiceImpl.init();

    getIt.registerLazySingleton<HiveServiceImpl>(
          () => HiveServiceImpl.instance,
    );
    getIt.registerLazySingleton<IUserCache>(()=> HiveServiceImpl.instance);
    getIt.registerLazySingleton<ITokenCache>(() => HiveServiceImpl.instance);
    getIt.registerLazySingleton<IPaginatedCache<RestaurantModel>>(
      () => ProductPaginatedCache<RestaurantModel>(HiveServiceImpl.instance),
    );
    getIt.registerLazySingleton<IPaginatedCache<SearchRestaurantModel>>(
      () => ProductPaginatedCache<SearchRestaurantModel>(HiveServiceImpl.instance),
    );
  }
}