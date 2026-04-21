import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:jeebly_mobile/core/helpers/localization/locale_cubit.dart';
import 'package:jeebly_mobile/core/service_locator/hive_services_locator/hive_services_locator.dart';
import 'package:jeebly_mobile/core/service_locator/restaurant_service_locator/restaurants_service_locator.dart';
import 'package:jeebly_mobile/features/auth/cubit/auth_cubit.dart';
import 'package:jeebly_mobile/features/cart/order_flow/cubit/order_flow_cubit.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/cubit/account_cubit.dart';
import 'package:jeebly_mobile/features/drawer/addresses/bloc/addresses_bloc.dart';
import 'package:jeebly_mobile/features/drawer/addresses/cubit/address_cubit.dart';
import 'package:jeebly_mobile/features/drawer/addresses/data/datasource/addresses_datasource.dart';
import 'package:jeebly_mobile/features/drawer/map/cubit/profile_map_cubit.dart';
import 'package:jeebly_mobile/features/drawer/wallet/cubit/wallet_cubit.dart';
import 'package:jeebly_mobile/features/home/categories/cubit/categories_cubit.dart';
import 'package:jeebly_mobile/features/home/restaurants/manager/cubit/restaurant_cubit.dart';
import 'package:jeebly_mobile/features/layout/cubit/layout/layout_cubit.dart';
import 'package:jeebly_mobile/features/layout/cubit/map/map_cubit.dart';
import 'package:jeebly_mobile/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:jeebly_mobile/features/home/bloc/ads_bloc.dart';
import 'package:jeebly_mobile/features/home/data/datasource/ads_datasource.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/data/datasource/account_datasource.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/cubit/change_password_bloc/change_password_bloc.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/datasource/change_password_datasource.dart';
import 'package:jeebly_mobile/features/home/restaurants/manager/restaurannt_bloc/restaurant_bloc.dart';
import 'package:jeebly_mobile/features/home/restaurants/data/data_sources/restaurant_data_source.dart';
import '../http/api_consumer.dart';
import '../http/base_api_consumer.dart';
import '../http/connectivity_service.dart';
import '../http/endpoints.dart';
import '../http/generic_data_source.dart';
import '../http/sync_manager.dart';
import '../local_storage/local_storage.dart';
import 'auth_service_locator/auth_service_locator.dart';
import 'jeeply_eat_service_locator/jeebly_eat_service_locator.dart';
import '../../features/cart/data/data_sources/cart_datasource.dart';
import '../../features/cart/manager/cart_cubit.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  // Dio dio = DioFactory.getDio();

  getIt.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: Endpoints.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 30),
        // Add this to avoid quick timeouts
        receiveTimeout: const Duration(seconds: 30),
        // Add this too
        sendTimeout: const Duration(seconds: 30),
        headers: {
          'Accept': 'application/json',
          'Accept-Language': 'ar',
          'Authorization': "Bearer ${getIt<ITokenCache>().getAccessToken()?.accessToken}",
        },
      ),
    )..interceptors.add(
        LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
        ),
      ),
  );
  getIt.registerLazySingleton<ApiConsumer>(
    () => ApiConsumerImpl(
      dio: getIt<Dio>(),
    ),
  );
  getIt.registerLazySingleton<GenericDataSource>(
    () => GenericDataSource(getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<ConnectivityService>(
        () => ConnectivityService.instance,
  );

  getIt.registerSingleton<SyncManager>(SyncManager());
  //======= Cubits =======//
  getIt.registerLazySingleton<LocaleCubit>(() => LocaleCubit());
  getIt.registerFactory<OnboardingCubit>(() => OnboardingCubit());
  getIt.registerFactory<AuthCubit>(() => AuthCubit());
  getIt.registerLazySingleton<MapCubit>(() => MapCubit());
  getIt.registerFactory<LayoutCubit>(() => LayoutCubit());
  getIt.registerFactory<CategoriesCubit>(() => CategoriesCubit());

  getIt.registerLazySingleton<AccountDataSource>(
    () => AccountDataSourceImpl(getIt<GenericDataSource>()),
  );
  getIt.registerLazySingleton<AccountCubit>(
    () => AccountCubit(getIt<AccountDataSource>()),
  );
  getIt.registerFactory<RestaurantCubit>(() => RestaurantCubit());
  getIt.registerFactory<OrderFlowCubit>(() => OrderFlowCubit());
  getIt.registerFactory<WalletCubit>(() => WalletCubit());
  getIt.registerFactory<AddressCubit>(() => AddressCubit());
  getIt.registerLazySingleton<AddressesDatasource>(
    () => AddressesDatasourceImpl(getIt<GenericDataSource>()),
  );
  getIt.registerLazySingleton<AddressesBloc>(
    () => AddressesBloc(getIt<AddressesDatasource>()),
  );
  getIt.registerFactory<ProfileMapCubit>(() => ProfileMapCubit());
  
  getIt.registerLazySingleton<AdsDataSource>(
    () => AdsDataSourceImpl(getIt<GenericDataSource>()),
  );
  getIt.registerFactory<AdsBloc>(
    () => AdsBloc(getIt<AdsDataSource>()),
  );

  getIt.registerLazySingleton<ChangePasswordDatasource>(
    () => ChangePasswordDatasourceImpl(getIt<GenericDataSource>()),
  );
  getIt.registerFactory<ChangePasswordBloc>(
    () => ChangePasswordBloc(getIt<ChangePasswordDatasource>()),
  );
  getIt.registerLazySingleton<RestaurantDataSource>(
    () => RestaurantDataSourceImpl(getIt<GenericDataSource>()),
  );
  getIt.registerLazySingleton<RestaurantBloc>(
    () => RestaurantBloc(dataSource: getIt<RestaurantDataSource>()),
  );
  // getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt.get<AuthRepo>()));

  //======= Repos =======//

  await AuthServiceLocator.execute(getIt: getIt);
  await HiveServiceLocator.init(getIt: getIt);
  await JeeblyEatServiceLocator.init(getIt: getIt);
  await RestaurantServiceLocator.init(getIt: getIt);

  getIt.registerLazySingleton<CartDataSource>(
    () => CartDataSourceImpl(getIt<GenericDataSource>()),
  );
  getIt.registerFactory<CartCubit>(
    () => CartCubit(getIt<CartDataSource>()),
  );
}
