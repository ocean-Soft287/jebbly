import 'package:get_it/get_it.dart';

import '../../../features/cart/datasource/cart_datasource.dart';
import '../../../features/cart/datasource/general_cart_datasource.dart';
import '../../../features/cart/datasource/restaurant_cart_data_source.dart';
import '../../../features/cart/datasource/update_quantity_datasource.dart';
import '../../../features/cart/manager/cart_cubit.dart';
import '../../../features/cart/manager/general_cart_bloc/general_cart_bloc.dart';
import '../../../features/cart/manager/restaurant_cart_bloc/restaurant_cart_bloc.dart';
import '../../../features/cart/manager/update_quantity_cubit/update_quantity_cubit.dart';
import '../../http/generic_data_source.dart';

class CartServiceLocator {
  static Future<void> init({required GetIt getIt}) async {
    getIt.registerLazySingleton<CartDataSource>(
      () => CartDataSourceImpl(getIt<GenericDataSource>()),);
    getIt.registerFactory<CartCubit>(
      () => CartCubit(getIt<CartDataSource>()),);
    getIt.registerLazySingleton<RestaurantCartDataSource>(
      () => RestaurantCartDataSourceImpl(getIt()),);

    getIt.registerLazySingleton<GeneralCartDataSource>(
      () => GeneralCartDataSourceImpl(getIt()),);

    getIt.registerLazySingleton<UpdateQuantityDataSource>(
      () => UpdateQuantityDataSourceImpl(getIt()),);

    // Bloc
    getIt.registerFactory<GeneralCartBloc>(
      () => GeneralCartBloc(getIt()),
    );
    getIt.registerFactory<RestaurantCartBloc>(
      () => RestaurantCartBloc(getIt()),
    );
    getIt.registerFactory<UpdateQuantityCubit>(
      () => UpdateQuantityCubit(getIt()),
    );
  }
}
