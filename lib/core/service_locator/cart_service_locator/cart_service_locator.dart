import 'package:get_it/get_it.dart';

import '../../../features/cart/datasource/data_sources/cart_datasource.dart';
import '../../../features/cart/datasource/data_sources/general_cart_datasource.dart';
import '../../../features/cart/manager/cart_cubit.dart';
import '../../../features/cart/manager/general_cart_bloc/general_cart_bloc.dart';
import '../../http/generic_data_source.dart';

class CartServiceLocator {
  static Future<void> init({required GetIt getIt}) async {

    getIt.registerLazySingleton<CartDataSource>(
          () => CartDataSourceImpl(getIt<GenericDataSource>()),
    );
    getIt.registerFactory<CartCubit>(
          () => CartCubit(getIt<CartDataSource>()),
    );

    getIt.registerLazySingleton<GeneralCartDataSource>(
          () => GeneralCartDataSourceImpl(getIt()),
    );

    // Bloc
    getIt.registerFactory<GeneralCartBloc>(
          () => GeneralCartBloc(getIt()),
    );
  }}