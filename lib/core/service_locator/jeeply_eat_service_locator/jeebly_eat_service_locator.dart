import 'package:get_it/get_it.dart';

import '../../../features/home/jeebly_eat/datasource/search_restaurant_data_source.dart';
import '../../../features/home/jeebly_eat/jeebly_eat_imports.dart';
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

    // Bloc
    getIt.registerFactory<CategoryBloc>(
          () => CategoryBloc(getIt<CategoryDataSource>()),
    );
    getIt.registerFactory<SearchRestaurantBloc>(
          () => SearchRestaurantBloc(getIt<SearchRestaurantDataSource>()),
    );
  }
}