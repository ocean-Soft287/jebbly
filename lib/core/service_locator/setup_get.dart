import 'package:get_it/get_it.dart';
import 'package:jeebly_mobile/core/helpers/localization/locale_cubit.dart';
import 'package:jeebly_mobile/features/auth/cubit/auth_cubit.dart';
import 'package:jeebly_mobile/features/cart/order_flow/cubit/order_flow_cubit.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/cubit/account_cubit.dart';
import 'package:jeebly_mobile/features/drawer/addresses/cubit/address_cubit.dart';
import 'package:jeebly_mobile/features/drawer/map/cubit/profile_map_cubit.dart';
import 'package:jeebly_mobile/features/drawer/wallet/cubit/wallet_cubit.dart';
import 'package:jeebly_mobile/features/home/categories/cubit/categories_cubit.dart';
import 'package:jeebly_mobile/features/home/restaurants/cubit/restaurant_cubit.dart';
import 'package:jeebly_mobile/features/layout/cubit/layout/layout_cubit.dart';
import 'package:jeebly_mobile/features/layout/cubit/map/map_cubit.dart';
import 'package:jeebly_mobile/features/onboarding/cubit/onboarding_cubit.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  // Dio dio = DioFactory.getDio();

  //======= Cubits =======//
  getIt.registerFactory<LocaleCubit>(() => LocaleCubit());
  getIt.registerFactory<OnboardingCubit>(() => OnboardingCubit());
  getIt.registerFactory<AuthCubit>(() => AuthCubit());
  getIt.registerLazySingleton<MapCubit>(() => MapCubit());
  getIt.registerFactory<LayoutCubit>(() => LayoutCubit());
  getIt.registerFactory<CategoriesCubit>(() => CategoriesCubit());
  getIt.registerFactory<AccountCubit>(() => AccountCubit());
  getIt.registerFactory<RestaurantCubit>(() => RestaurantCubit());
  getIt.registerFactory<OrderFlowCubit>(() => OrderFlowCubit());
  getIt.registerFactory<WalletCubit>(() => WalletCubit());
  getIt.registerFactory<AddressCubit>(() => AddressCubit());
  getIt.registerFactory<ProfileMapCubit>(() => ProfileMapCubit());
  // getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt.get<AuthRepo>()));

  //======= Repos =======//
  // getIt.registerSingleton<AuthRepo>(AuthRepo(ApiService(dio)));
}