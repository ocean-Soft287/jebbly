import 'package:get_it/get_it.dart';

import '../../../features/home/restaurants/data/data_sources/restaurants_details_data_source/restaurants_details_data_source.dart';
import '../../../features/home/restaurants/manager/restaurant_details_bloc/restaurant_details_bloc.dart';
import '../../http/generic_data_source.dart';

class RestaurantServiceLocator {
  static Future<void> init({required GetIt getIt}) async {
    // DataSource
    getIt.registerLazySingleton<RestaurantDetailsDataSource>(
          () => RestaurantDetailsDataSourceImpl(getIt<GenericDataSource>()),
    );

    // Bloc
    getIt.registerFactory<RestaurantDetailsBloc>(
          () => RestaurantDetailsBloc(getIt<RestaurantDetailsDataSource>()),
    );


  }
}