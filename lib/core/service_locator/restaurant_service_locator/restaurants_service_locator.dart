import 'package:get_it/get_it.dart';

import '../../../features/home/restaurants/data/data_sources/restaurant_category_datasource.dart';
import '../../../features/home/restaurants/data/data_sources/restaurants_details_data_source/restaurants_details_data_source.dart';
import '../../../features/home/restaurants/data/data_sources/restaurant_data_source.dart';
import '../../../features/home/restaurants/manager/product_bloc/product_bloc.dart';
import '../../../features/home/restaurants/manager/restaurant_category_bloc/restaurant_category_bloc.dart';
import '../../../features/home/restaurants/manager/restaurant_details_bloc/restaurant_details_bloc.dart';
import '../../http/generic_data_source.dart';

class RestaurantServiceLocator {
  static Future<void> init({required GetIt getIt}) async {
    // DataSource
    getIt.registerLazySingleton<RestaurantDetailsDataSource>(
          () => RestaurantDetailsDataSourceImpl(getIt<GenericDataSource>()),
    );

    getIt.registerLazySingleton<RestaurantCategoryDataSource>(
          () => RestaurantCategoryDataSourceImpl(getIt<GenericDataSource>()),
    );

    // Bloc
    getIt.registerFactory<RestaurantDetailsBloc>(
          () => RestaurantDetailsBloc(getIt<RestaurantDetailsDataSource>()),
    );
    getIt.registerFactory<RestaurantCategoryBloc>(
          () => RestaurantCategoryBloc(getIt<RestaurantCategoryDataSource>()),
    );
    getIt.registerFactory<ProductBloc>(
          () => ProductBloc(getIt<RestaurantDataSource>()),
    );
  }
}