part of 'router.dart';

class AppRouter {
  // static const splashView = Routes.splashView;
  // static const layoutView = Routes.layoutView;

  static late String? token;
  static late String? country;

  static Future<void> init() async {
    // Initialize CacheHelper or whatever you need before getting the token
    // await CacheHelper().initPrefs();
    // token = await CacheHelper().getData('access_token');
    // country = await CacheHelper().getData(CacheHelperVars.countryId);
    // print("access TOKEN >>><<<<< $token");
    // print("Country >>><<<<< $country");
  }

  static final routes = GoRouter(routes: [
    GoRoute(
        path: "/",
        pageBuilder: (context, state) {
          // if (token != null && token != 'null' && country != null) {
          //   return _fadePageBuilder(const LayoutView(), state);
          // } else if (token != null && token != 'null' && country == null) {
          //   return _fadePageBuilder(const SelectCountryView(), state);
          // } else {
          //   return _fadePageBuilder(const SplashView(), state);
          // }
          return _fadePageBuilder(const SplashScreen(), state);
        }),
    GoRoute(
        path: RoutesNames.onBoarding,
        pageBuilder: (_, state) {
          return _slidePageBuilder(
              BlocProvider(
                  create: (_) => getIt.get<OnboardingCubit>(),
                  child: const OnboardingScreen()),
              state,
              duration: Duration(milliseconds: 1000));
        }),
    GoRoute(
        path: RoutesNames.signup,
        pageBuilder: (_, state) => _fadePageBuilder(
            RepositoryProvider<RegisterDataSource>(
              create: (_) => getIt.get<RegisterDataSource>(),
              child: MultiBlocProvider(providers: [
                BlocProvider(create: (_) => getIt.get<AuthCubit>()),
                BlocProvider(create: (_) => getIt.get<RegisterCubit>()),
              ], child: const SignupScreen()),
            ),
            state)),
    GoRoute(
        path: RoutesNames.login,
        pageBuilder: (_, state) {
          return _slidePageBuilder(
              MultiBlocProvider(providers: [
                BlocProvider(create: (_) => getIt.get<AuthCubit>()),
                BlocProvider(create: (_) => getIt.get<LoginCubit>()),
              ], child:  LoginScreen()),
              state);
        }),
    GoRoute(
        path: RoutesNames.enterPhone,
        pageBuilder: (_, state) {
          final fromAccount = state.extra as bool?;
          return _slidePageBuilder(
              BlocProvider(
                  create: (_) => getIt.get<AuthCubit>(),
                  child: EnterPhoneScreen(fromAccount: fromAccount)),
              state);
        }),
    GoRoute(
        path: RoutesNames.map,
        pageBuilder: (_, state) {
          return _slidePageBuilder(
              BlocProvider(
                  create: (_) => getIt.get<MapCubit>()..getLocationUpdates(),
                  child: const MapScreen()),
              state);
        }),
    GoRoute(
        path: RoutesNames.selectService,
        pageBuilder: (_, state) {
          return _slidePageBuilder(const SelectServiceScreen(), state);
        }),
    GoRoute(
        path: RoutesNames.layout,
        pageBuilder: (_, state) {
          final index = state.extra as int;
          return _slidePageBuilder(
              BlocProvider(
                  create: (_) => getIt.get<LayoutCubit>()..setHomeIndex(index),
                  child: const LayoutScreen()),
              state);
        }),
    GoRoute(
        path: RoutesNames.categoryDetails,
        pageBuilder: (_, state) {
          return _slidePageBuilder(
              BlocProvider(
                  create: (_) => getIt.get<CategoriesCubit>(),
                  child: const CategoryDetailsScreen()),
              state);
        }),
    GoRoute(
        path: RoutesNames.categories,
        pageBuilder: (_, state) {
          return _slidePageBuilder(const CategoriesScreen(), state);
        }),
    GoRoute(
        path: RoutesNames.account,
        pageBuilder: (_, state) {
          return _slidePageBuilder(
              BlocProvider(
                  create: (_) => getIt.get<AccountCubit>(),
                  child: const AccountScreen()),
              state);
        }),
    GoRoute(
        path: RoutesNames.accountData,
        pageBuilder: (_, state) {
          return _slidePageBuilder(
              BlocProvider(
                  create: (_) => getIt.get<AccountCubit>(),
                  child: const AccountDataScreen()),
              state);
        }),
    GoRoute(
        path: RoutesNames.changePassword,
        pageBuilder: (_, state) {
          return _slidePageBuilder(
              BlocProvider(
                  create: (_) => getIt.get<AccountCubit>(),
                  child: const ChangePasswordScreen()),
              state);
        }),
    GoRoute(
        path: RoutesNames.addresses,
        pageBuilder: (_, state) {
          return _slidePageBuilder(const AddressesScreen(), state);
        }),
    GoRoute(
        path: RoutesNames.restaurantDetails,
        pageBuilder: (_, state) {
          return _slidePageBuilder(
              BlocProvider(
                  create: (_) => getIt.get<RestaurantCubit>(),
                  child: const RestaurantDetailsScreen()),
              state);
        }),
    GoRoute(
        path: RoutesNames.productDetails,
        pageBuilder: (_, state) {
          final withIngredients = state.extra as bool?;
          return _slidePageBuilder(
              ProductDetailsScreen(withIngredients: withIngredients), state);
        }),
    GoRoute(
        path: RoutesNames.storeDetails,
        pageBuilder: (_, state) {
          return _slidePageBuilder(const StoreDetailsScreen(), state);
        }),
    GoRoute(
        path: RoutesNames.storeCategoryDetails,
        pageBuilder: (_, state) {
          return _slidePageBuilder(const StoreCategoryDetailsScreen(), state);
        }),
    GoRoute(
        path: RoutesNames.orderSummary,
        pageBuilder: (_, state) {
          return _slidePageBuilder(
              BlocProvider(
                  create: (_) => getIt.get<OrderFlowCubit>(),
                  child: const OrderSummaryScreen()),
              state);
        }),
    GoRoute(
        path: RoutesNames.orderConfirmation,
        pageBuilder: (_, state) {
          return _slidePageBuilder(
              BlocProvider(
                  create: (_) => getIt.get<OrderFlowCubit>(),
                  child: const OrderConfirmationScreen()),
              state);
        }),
    GoRoute(
        path: RoutesNames.orderStatus,
        pageBuilder: (_, state) {
          return _slidePageBuilder(const OrderStatusScreen(), state);
        }),
    GoRoute(
        path: RoutesNames.myWallet,
        pageBuilder: (_, state) {
          return _slidePageBuilder(
              BlocProvider(
                  create: (_) => getIt.get<WalletCubit>(),
                  child: const MyWalletScreen()),
              state);
        }),
    GoRoute(
        path: RoutesNames.addEditAddress,
        pageBuilder: (_, state) {
          final address = state.extra as AddressModel?;
          return _slidePageBuilder(
              AddEditAddressScreen(address: address),
              state);
        }),
    GoRoute(
        path: RoutesNames.profileMap,
        pageBuilder: (_, state) {
          return _slidePageBuilder(
              BlocProvider(
                  create: (_) => getIt.get<ProfileMapCubit>(),
                  child: const ProfileMapScreen()),
              state);
        }),
    GoRoute(
        path: RoutesNames.updatePasswordSuccess,
        pageBuilder: (_, state) {
          final fromProfile = state.extra as bool?;
          return _slidePageBuilder(
              UpdatePasswordSuccessScreen(fromProfile: fromProfile), state);
        }),
    GoRoute(
        path: RoutesNames.otp,
        pageBuilder: (_, state) {
          return _slidePageBuilder(
              BlocProvider(
                  create: (_) => getIt.get<AuthCubit>(),
                  child: const OtpScreen()),
              state);
        }),
    GoRoute(
        path: RoutesNames.newPassword,
        pageBuilder: (_, state) {
          return _slidePageBuilder(
              BlocProvider(
                  create: (_) => getIt.get<AuthCubit>(),
                  child: const NewPasswordScreen()),
              state);
        }),
    GoRoute(
        path: RoutesNames.termsAndConditions,
        pageBuilder: (_, state) {
          return _slidePageBuilder(const TermsAndConditionsScreen(), state);
        }),
    GoRoute(
        path: RoutesNames.aboutUs,
        pageBuilder: (_, state) {
          return _slidePageBuilder(BlocProvider(
              create: (_) => getIt.get<AccountCubit>(),
              child: const AboutUsScreen()), state);
        })
  ]);

  //======= Navigation Animations Functions =======//
  static Page<dynamic> _fadePageBuilder(Widget child, GoRouterState state) {
    return CustomTransitionPage<void>(
        key: state.pageKey,
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final fadeAnimation = Tween(begin: 0.4, end: 1.0).animate(animation);
          return FadeTransition(opacity: fadeAnimation, child: child);
        });
  }

  static Page<dynamic> _slidePageBuilder(Widget child, GoRouterState state,
      {Duration? duration}) {
    return CustomTransitionPage<void>(
        key: state.pageKey,
        child: child,
        transitionDuration: duration ?? const Duration(milliseconds: 400),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final slideAnimation =
          Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
              .animate(animation);

          return SlideTransition(position: slideAnimation, child: child);
        });
  }
}