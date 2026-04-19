import 'package:get_it/get_it.dart';

import '../../../features/home/jeebly_eat/datasource/category_restaurants_datasource.dart';
import '../../../features/home/jeebly_eat/datasource/search_restaurant_data_source.dart';
import '../../../features/home/jeebly_eat/jeebly_eat_imports.dart';
import '../../../features/home/jeebly_eat/manager/category_restaurants_bloc/category_restaurants_bloc.dart';
import '../../../features/home/jeebly_eat/manager/high_rated_restaurants_bloc/high_rated_restaurants_bloc.dart';
import '../../../features/home/jeebly_eat/manager/search_restaurant_bloc/search_restaurant_bloc.dart';
import '../../http/generic_data_source.dart';

class JeeblyEatServiceLocator {
  static Future<void> init({required GetIt getIt}) async {
    // DataSource
    getIt.registerLazySingleton<CategoryDataSource>(
          () => CategoryDataSourceImpl(getIt<GenericDataSource>()),
    );

    // Bloc
    getIt.registerLazySingleton<SearchRestaurantDataSource>(
          () => SearchRestaurantDataSourceImpl(getIt<GenericDataSource>()),
    );

    getIt.registerLazySingleton<CategoryRestaurantsDataSource>(
          () => CategoryRestaurantsDataSourceImpl(getIt<GenericDataSource>()),
    );

    // Bloc
    getIt.registerLazySingleton<CategoryBloc>(
          () => CategoryBloc(getIt<CategoryDataSource>()),
    );
    getIt.registerLazySingleton<SearchRestaurantBloc>(
          () => SearchRestaurantBloc(getIt<SearchRestaurantDataSource>()),
    );
    getIt.registerLazySingleton<HighRatedRestaurantsBloc>(
          () => HighRatedRestaurantsBloc(dataSource:getIt<GenericDataSource>()),
    );
    getIt.registerFactory<CategoryRestaurantsBloc>(
          () => CategoryRestaurantsBloc(getIt<CategoryRestaurantsDataSource>()),
    );
  }
}