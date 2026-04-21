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

  static final routes = GoRouter(
      navigatorKey: navigatorKey,
      routes: [
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
    // Onboarding
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
    // Signup
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
    // Login
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
    // Enter Phone
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
    // Map
    GoRoute(
        path: RoutesNames.map,
        pageBuilder: (_, state) {
          return _slidePageBuilder(
              BlocProvider(
                  create: (_) => getIt.get<MapCubit>()..getLocationUpdates(),
                  child: const MapScreen()),
              state);
        }),
    // Select Service
    GoRoute(
        path: RoutesNames.selectService,
        pageBuilder: (_, state) {
          return _slidePageBuilder(const SelectServiceScreen(), state);
        }),
    // Layout
    GoRoute(
        path: RoutesNames.layout,
        pageBuilder: (_, state) {
          final index = state.extra as int;
          return _slidePageBuilder(
              MultiBlocProvider(
                providers: [
                  BlocProvider(create: (_) => getIt.get<LayoutCubit>()..setHomeIndex(index)),
                  BlocProvider.value(value: getIt.get<CategoryBloc>()),
                  BlocProvider.value(value: getIt.get<RestaurantBloc>()),
                  BlocProvider.value(value: getIt.get<SearchRestaurantBloc>()),
                  BlocProvider.value(value: getIt.get<HighRatedRestaurantsBloc>()),
                ],
                child: const LayoutScreen(),
              ),
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
    // Eat Restaurants
    GoRoute(
        path: RoutesNames.eatRestaurants,
        pageBuilder: (_, state) {
          final categoryId = state.extra as int;
          return _slidePageBuilder(EatRestaurantsScreen(categoryId: categoryId.toString()), state);
        }),
    // Account
    GoRoute(
        path: RoutesNames.account,
        pageBuilder: (_, state) {
          return _slidePageBuilder(
              BlocProvider(
                  create: (_) => getIt.get<AccountCubit>(),
                  child: const AccountScreen()),
              state);
        }),
    // Account Data
    GoRoute(
        path: RoutesNames.accountData,
        pageBuilder: (_, state) {
          return _slidePageBuilder(
              BlocProvider(
                  create: (_) => getIt.get<AccountCubit>(),
                  child: const AccountDataScreen()),
              state);
        }),
    // Change Password
    GoRoute(
        path: RoutesNames.changePassword,
        pageBuilder: (_, state) {
          return _slidePageBuilder(
              BlocProvider(
                  create: (_) => getIt.get<AccountCubit>(),
                  child: const ChangePasswordScreen()),
              state);
        }),
    // Addresses
    GoRoute(
        path: RoutesNames.addresses,
        pageBuilder: (_, state) {
          return _slidePageBuilder(const AddressesScreen(), state);
        }),
    // Restaurant Details
    GoRoute(
        path: RoutesNames.restaurantDetails,
        pageBuilder: (_, state) {
          final id = state.extra as int;
          return _slidePageBuilder(
              BlocProvider(
                  create: (_) => getIt.get<RestaurantCubit>(),
                  child:  RestaurantDetailsScreen( restaurantId: id,)),
              state);
        }),
    // New Restaurants
    GoRoute(
        path: RoutesNames.newRestaurants,
        pageBuilder: (_, state) {
          return _slidePageBuilder(
              BlocProvider(
                  create: (_) => getIt.get<RestaurantBloc>()
                    ..add(const LoadFirstPage<RestaurantModel>()),
                  child: const NewRestaurantsScreen()),
              state);
        }),
    // All Restaurants
    GoRoute(
        path: RoutesNames.allRestaurants,
        pageBuilder: (_, state) {
          return _slidePageBuilder(
              BlocProvider(
                  create: (_) => getIt.get<RestaurantBloc>()
                    ..add(const LoadFirstPage<RestaurantModel>()),
                  child: const AllRestaurants()),
              state);
        }),
    // Product Details
    GoRoute(
        path: RoutesNames.productDetails,
        pageBuilder: (_, state) {
          final withIngredients = state.extra as bool?;
          return _slidePageBuilder(
              ProductDetailsScreen(withIngredients: withIngredients), state);
        }),
    // Store Details
    GoRoute(
        path: RoutesNames.storeDetails,
        pageBuilder: (_, state) {
          return _slidePageBuilder(const StoreDetailsScreen(), state);
        }),
    // Search Restaurants
    GoRoute(
        path: RoutesNames.searchRestaurants,
        pageBuilder: (_, state) {
          return _slidePageBuilder(
              BlocProvider(
                  create: (_) => getIt.get<SearchRestaurantBloc>(),
                  child: const SearchRestaurantsScreen()),
              state);
        }),
    // Store Category Details
    GoRoute(
        path: RoutesNames.storeCategoryDetails,
        pageBuilder: (_, state) {
          return _slidePageBuilder(const StoreCategoryDetailsScreen(), state);
        }),
    // Order Summary
    GoRoute(
        path: RoutesNames.orderSummary,
        pageBuilder: (_, state) {
          return _slidePageBuilder(
              BlocProvider(
                  create: (_) => getIt.get<OrderFlowCubit>(),
                  child: const OrderSummaryScreen()),
              state);
        }),
    // Order Confirmation
    GoRoute(
        path: RoutesNames.orderConfirmation,
        pageBuilder: (_, state) {
          return _slidePageBuilder(
              BlocProvider(
                  create: (_) => getIt.get<OrderFlowCubit>(),
                  child: const OrderConfirmationScreen()),
              state);
        }),
    // Order Status
    GoRoute(
        path: RoutesNames.orderStatus,
        pageBuilder: (_, state) {
          return _slidePageBuilder(const OrderStatusScreen(), state);
        }),
    // My Wallet
    GoRoute(
        path: RoutesNames.myWallet,
        pageBuilder: (_, state) {
          return _slidePageBuilder(
              BlocProvider(
                  create: (_) => getIt.get<WalletCubit>(),
                  child: const MyWalletScreen()),
              state);
        }),
    // Add Edit Address
    GoRoute(
        path: RoutesNames.addEditAddress,
        pageBuilder: (_, state) {
          final address = state.extra as AddressModel?;
          return _slidePageBuilder(
              AddEditAddressScreen(address: address),
              state);
        }),
    // Profile Map
    GoRoute(
        path: RoutesNames.profileMap,
        pageBuilder: (_, state) {
          return _slidePageBuilder(
              BlocProvider(
                  create: (_) => getIt.get<ProfileMapCubit>(),
                  child: const ProfileMapScreen()),
              state);
        }),
    // Update Password Success
    GoRoute(
        path: RoutesNames.updatePasswordSuccess,
        pageBuilder: (_, state) {
          final fromProfile = state.extra as bool?;
          return _slidePageBuilder(
              UpdatePasswordSuccessScreen(fromProfile: fromProfile), state);
        }),
    // OTP
    GoRoute(
        path: RoutesNames.otp,
        pageBuilder: (_, state) {
          return _slidePageBuilder(
              BlocProvider(
                  create: (_) => getIt.get<AuthCubit>(),
                  child: const OtpScreen()),
              state);
        }),
    // New Password
    GoRoute(
        path: RoutesNames.newPassword,
        pageBuilder: (_, state) {
          return _slidePageBuilder(
              BlocProvider(
                  create: (_) => getIt.get<AuthCubit>(),
                  child: const NewPasswordScreen()),
              state);
        }),
    // Terms and Conditions
    GoRoute(
        path: RoutesNames.termsAndConditions,
        pageBuilder: (_, state) {
          return _slidePageBuilder(const TermsAndConditionsScreen(), state);
        }),
    // About Us
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