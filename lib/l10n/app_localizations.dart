import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @lorem.
  ///
  /// In en, this message translates to:
  /// **'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'**
  String get lorem;

  /// No description provided for @change_language.
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get change_language;

  /// No description provided for @a_variety_of_restaurants_to_order_from.
  ///
  /// In en, this message translates to:
  /// **'A variety of restaurants to order from'**
  String get a_variety_of_restaurants_to_order_from;

  /// No description provided for @discover_our_diverse_selection_of_snacks.
  ///
  /// In en, this message translates to:
  /// **'Discover our diverse selections of snacks'**
  String get discover_our_diverse_selection_of_snacks;

  /// No description provided for @shop_with_ease_and_enjoy_a_unique_experience.
  ///
  /// In en, this message translates to:
  /// **'Shop with ease and enjoy a unique experience'**
  String get shop_with_ease_and_enjoy_a_unique_experience;

  /// No description provided for @not_just_restaurants_even_sweets_are_available.
  ///
  /// In en, this message translates to:
  /// **'Not just restaurants, even sweets are available'**
  String get not_just_restaurants_even_sweets_are_available;

  /// No description provided for @register_a_new_account.
  ///
  /// In en, this message translates to:
  /// **'Register a new account'**
  String get register_a_new_account;

  /// No description provided for @already_have_an_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account'**
  String get already_have_an_account;

  /// No description provided for @continue_as_a_guest.
  ///
  /// In en, this message translates to:
  /// **'Continue as a guest'**
  String get continue_as_a_guest;

  /// No description provided for @create_a_new_acc.
  ///
  /// In en, this message translates to:
  /// **'Create a new account'**
  String get create_a_new_acc;

  /// No description provided for @a_few_simple_steps_stand_between_you_and_ordering_from_Jeebly.
  ///
  /// In en, this message translates to:
  /// **'A few simple steps stand between you and ordering from Jeebly'**
  String get a_few_simple_steps_stand_between_you_and_ordering_from_Jeebly;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @countries_codes.
  ///
  /// In en, this message translates to:
  /// **'Countries codes'**
  String get countries_codes;

  /// No description provided for @phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phone_number;

  /// No description provided for @first_and_last_name.
  ///
  /// In en, this message translates to:
  /// **'First and last name'**
  String get first_and_last_name;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @pass_hint.
  ///
  /// In en, this message translates to:
  /// **'(6+ letters/numbers)'**
  String get pass_hint;

  /// No description provided for @create_account.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get create_account;

  /// No description provided for @when_you_create_an_account_you_agree_to.
  ///
  /// In en, this message translates to:
  /// **'When you create an account you agree to'**
  String get when_you_create_an_account_you_agree_to;

  /// No description provided for @terms_and_conditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and conditions'**
  String get terms_and_conditions;

  /// No description provided for @already_have_an_account_ii.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get already_have_an_account_ii;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @welcome_once_again.
  ///
  /// In en, this message translates to:
  /// **'Welcome once again'**
  String get welcome_once_again;

  /// No description provided for @login_with_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Login with phone number'**
  String get login_with_phone_number;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgot_password;

  /// No description provided for @do_not_have_an_account.
  ///
  /// In en, this message translates to:
  /// **'Do not have an account?'**
  String get do_not_have_an_account;

  /// No description provided for @please_enter_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Please enter phone number'**
  String get please_enter_phone_number;

  /// No description provided for @do_not_worry_we_will_help_u_to_create_a_new_password.
  ///
  /// In en, this message translates to:
  /// **'Do not worry! We will help you to create a new password'**
  String get do_not_worry_we_will_help_u_to_create_a_new_password;

  /// No description provided for @continue_text.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue_text;

  /// No description provided for @phone_number_is_required.
  ///
  /// In en, this message translates to:
  /// **'Phone number is required'**
  String get phone_number_is_required;

  /// No description provided for @only_numbers_are_allowed.
  ///
  /// In en, this message translates to:
  /// **'Only numbers are allowed'**
  String get only_numbers_are_allowed;

  /// No description provided for @password_is_required.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get password_is_required;

  /// No description provided for @name_is_required.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get name_is_required;

  /// No description provided for @password_must_be_at_least_6_characters_long.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters long'**
  String get password_must_be_at_least_6_characters_long;

  /// No description provided for @password_must_include_both_letters_and_numbers.
  ///
  /// In en, this message translates to:
  /// **'Password must include both letters and numbers'**
  String get password_must_include_both_letters_and_numbers;

  /// No description provided for @search_city_street.
  ///
  /// In en, this message translates to:
  /// **'Search city street...'**
  String get search_city_street;

  /// No description provided for @locate_me.
  ///
  /// In en, this message translates to:
  /// **'Locate me'**
  String get locate_me;

  /// No description provided for @delivery_location.
  ///
  /// In en, this message translates to:
  /// **'Delivery location'**
  String get delivery_location;

  /// No description provided for @delivery_to.
  ///
  /// In en, this message translates to:
  /// **'Delivery to'**
  String get delivery_to;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @search_in_jeebly.
  ///
  /// In en, this message translates to:
  /// **'Search in Jeebly'**
  String get search_in_jeebly;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @browse_services.
  ///
  /// In en, this message translates to:
  /// **'Browse services'**
  String get browse_services;

  /// No description provided for @jeebly_eat.
  ///
  /// In en, this message translates to:
  /// **'Jeebly eat'**
  String get jeebly_eat;

  /// No description provided for @restaurants.
  ///
  /// In en, this message translates to:
  /// **'Restaurants'**
  String get restaurants;

  /// No description provided for @jeebly_get.
  ///
  /// In en, this message translates to:
  /// **'Jeebly get'**
  String get jeebly_get;

  /// No description provided for @food.
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get food;

  /// No description provided for @jeebly_shop.
  ///
  /// In en, this message translates to:
  /// **'Jeebly shop'**
  String get jeebly_shop;

  /// No description provided for @stores.
  ///
  /// In en, this message translates to:
  /// **'Stores'**
  String get stores;

  /// No description provided for @explore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get explore;

  /// No description provided for @fav.
  ///
  /// In en, this message translates to:
  /// **'Favourites'**
  String get fav;

  /// No description provided for @offers.
  ///
  /// In en, this message translates to:
  /// **'Offers'**
  String get offers;

  /// No description provided for @my_orders.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get my_orders;

  /// No description provided for @home_ii.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home_ii;

  /// No description provided for @my_wallet.
  ///
  /// In en, this message translates to:
  /// **'My wallet'**
  String get my_wallet;

  /// No description provided for @my_addresses.
  ///
  /// In en, this message translates to:
  /// **'My addresses'**
  String get my_addresses;

  /// No description provided for @acc_and_settings.
  ///
  /// In en, this message translates to:
  /// **'Account and settings'**
  String get acc_and_settings;

  /// No description provided for @call_cs.
  ///
  /// In en, this message translates to:
  /// **'Call customer service'**
  String get call_cs;

  /// No description provided for @search_for_restaurant_or_item.
  ///
  /// In en, this message translates to:
  /// **'Search for restaurants or items'**
  String get search_for_restaurant_or_item;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @high_rated_restaurants.
  ///
  /// In en, this message translates to:
  /// **'High rated restaurants'**
  String get high_rated_restaurants;

  /// No description provided for @pickup_is_available.
  ///
  /// In en, this message translates to:
  /// **'Pickup is available'**
  String get pickup_is_available;

  /// No description provided for @km.
  ///
  /// In en, this message translates to:
  /// **'KM'**
  String get km;

  /// No description provided for @delivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get delivery;

  /// No description provided for @all_restaurants.
  ///
  /// In en, this message translates to:
  /// **'All restaurants'**
  String get all_restaurants;

  /// No description provided for @fav_stores.
  ///
  /// In en, this message translates to:
  /// **'Favourite stores'**
  String get fav_stores;

  /// No description provided for @free.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get free;

  /// No description provided for @store_offers.
  ///
  /// In en, this message translates to:
  /// **'Store offers'**
  String get store_offers;

  /// No description provided for @results.
  ///
  /// In en, this message translates to:
  /// **'Results'**
  String get results;

  /// No description provided for @browse_categories.
  ///
  /// In en, this message translates to:
  /// **'Browse categories'**
  String get browse_categories;

  /// No description provided for @app_settings.
  ///
  /// In en, this message translates to:
  /// **'App settings'**
  String get app_settings;

  /// No description provided for @acc_data.
  ///
  /// In en, this message translates to:
  /// **'Account data'**
  String get acc_data;

  /// No description provided for @lang.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get lang;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @about_us.
  ///
  /// In en, this message translates to:
  /// **'About us'**
  String get about_us;

  /// No description provided for @rate_app.
  ///
  /// In en, this message translates to:
  /// **'Rate app'**
  String get rate_app;

  /// No description provided for @exit.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get exit;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @delete_my_account.
  ///
  /// In en, this message translates to:
  /// **'Delete my account'**
  String get delete_my_account;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @invalid_email.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get invalid_email;

  /// No description provided for @save_changes.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get save_changes;

  /// No description provided for @change_password.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get change_password;

  /// No description provided for @old_password.
  ///
  /// In en, this message translates to:
  /// **'Old password'**
  String get old_password;

  /// No description provided for @new_password.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get new_password;

  /// No description provided for @old_password_is_required.
  ///
  /// In en, this message translates to:
  /// **'Old password is required'**
  String get old_password_is_required;

  /// No description provided for @new_password_is_required.
  ///
  /// In en, this message translates to:
  /// **'New password is required'**
  String get new_password_is_required;

  /// No description provided for @show.
  ///
  /// In en, this message translates to:
  /// **'Show'**
  String get show;

  /// No description provided for @hide.
  ///
  /// In en, this message translates to:
  /// **'Hide'**
  String get hide;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @add_new_address.
  ///
  /// In en, this message translates to:
  /// **'Add new address'**
  String get add_new_address;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @new_restaurant.
  ///
  /// In en, this message translates to:
  /// **'New restaurant'**
  String get new_restaurant;

  /// No description provided for @search_for_product_or_store.
  ///
  /// In en, this message translates to:
  /// **'Search for product or store'**
  String get search_for_product_or_store;

  /// No description provided for @browse_based_on_category.
  ///
  /// In en, this message translates to:
  /// **'Browse based on category'**
  String get browse_based_on_category;

  /// No description provided for @cosmetics.
  ///
  /// In en, this message translates to:
  /// **'Cosmetics'**
  String get cosmetics;

  /// No description provided for @furniture_and_home_accessories.
  ///
  /// In en, this message translates to:
  /// **'Furniture and home accessories'**
  String get furniture_and_home_accessories;

  /// No description provided for @all_stores.
  ///
  /// In en, this message translates to:
  /// **'All stores'**
  String get all_stores;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @rating.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get rating;

  /// No description provided for @preparation_time.
  ///
  /// In en, this message translates to:
  /// **'Preparation time'**
  String get preparation_time;

  /// No description provided for @open.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// No description provided for @work_schedule.
  ///
  /// In en, this message translates to:
  /// **'Work schedule'**
  String get work_schedule;

  /// No description provided for @search_for_your_fav_meal.
  ///
  /// In en, this message translates to:
  /// **'Search for your favorite meal'**
  String get search_for_your_fav_meal;

  /// No description provided for @delivery_service.
  ///
  /// In en, this message translates to:
  /// **'Delivery service'**
  String get delivery_service;

  /// No description provided for @receive_from_restaurant.
  ///
  /// In en, this message translates to:
  /// **'Receive from restaurant'**
  String get receive_from_restaurant;

  /// No description provided for @minimum_order.
  ///
  /// In en, this message translates to:
  /// **'Minimum order'**
  String get minimum_order;

  /// No description provided for @show_cart.
  ///
  /// In en, this message translates to:
  /// **'Show cart'**
  String get show_cart;

  /// No description provided for @main_ingredients.
  ///
  /// In en, this message translates to:
  /// **'Main ingredients'**
  String get main_ingredients;

  /// No description provided for @closed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get closed;

  /// No description provided for @discounts_up_to.
  ///
  /// In en, this message translates to:
  /// **'Discounts up to'**
  String get discounts_up_to;

  /// No description provided for @search_in_store.
  ///
  /// In en, this message translates to:
  /// **'Search in store'**
  String get search_in_store;

  /// No description provided for @add_to_cart.
  ///
  /// In en, this message translates to:
  /// **'Add to cart'**
  String get add_to_cart;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @your_order_from.
  ///
  /// In en, this message translates to:
  /// **'your order from'**
  String get your_order_from;

  /// No description provided for @add_element.
  ///
  /// In en, this message translates to:
  /// **'Add element'**
  String get add_element;

  /// No description provided for @order_items.
  ///
  /// In en, this message translates to:
  /// **'Order items'**
  String get order_items;

  /// No description provided for @summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summary;

  /// No description provided for @item_price.
  ///
  /// In en, this message translates to:
  /// **'Item price'**
  String get item_price;

  /// No description provided for @app_commission.
  ///
  /// In en, this message translates to:
  /// **'App Commission'**
  String get app_commission;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @confirm_order.
  ///
  /// In en, this message translates to:
  /// **'Confirm order'**
  String get confirm_order;

  /// No description provided for @order_summary.
  ///
  /// In en, this message translates to:
  /// **'Order summary'**
  String get order_summary;

  /// No description provided for @delivery_info.
  ///
  /// In en, this message translates to:
  /// **'Delivery info'**
  String get delivery_info;

  /// No description provided for @payment_method.
  ///
  /// In en, this message translates to:
  /// **'Payment method'**
  String get payment_method;

  /// No description provided for @in_cash.
  ///
  /// In en, this message translates to:
  /// **'In cash'**
  String get in_cash;

  /// No description provided for @wallet.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get wallet;

  /// No description provided for @waiting_for_store_to_accept_your_order.
  ///
  /// In en, this message translates to:
  /// **'Waiting for store to accept your order'**
  String get waiting_for_store_to_accept_your_order;

  /// No description provided for @store_is_making_sure_that_products_u_ordered_are_available_before_accepting_your_order.
  ///
  /// In en, this message translates to:
  /// **'Store is making sure that products you ordered are available before accepting your order'**
  String get store_is_making_sure_that_products_u_ordered_are_available_before_accepting_your_order;

  /// No description provided for @waiting_for_store_acceptance.
  ///
  /// In en, this message translates to:
  /// **'Waiting for store acceptance'**
  String get waiting_for_store_acceptance;

  /// No description provided for @preparation_in_progress.
  ///
  /// In en, this message translates to:
  /// **'Preparation in progress'**
  String get preparation_in_progress;

  /// No description provided for @in_store.
  ///
  /// In en, this message translates to:
  /// **'In store'**
  String get in_store;

  /// No description provided for @in_the_way.
  ///
  /// In en, this message translates to:
  /// **'In the way'**
  String get in_the_way;

  /// No description provided for @jeebly_is_waiting_u.
  ///
  /// In en, this message translates to:
  /// **'Jeebly is waiting you'**
  String get jeebly_is_waiting_u;

  /// No description provided for @order_details.
  ///
  /// In en, this message translates to:
  /// **'Order details'**
  String get order_details;

  /// No description provided for @your_address.
  ///
  /// In en, this message translates to:
  /// **'Your address'**
  String get your_address;

  /// No description provided for @your_order_summary.
  ///
  /// In en, this message translates to:
  /// **'Your order summary'**
  String get your_order_summary;

  /// No description provided for @credit_available_for_usage.
  ///
  /// In en, this message translates to:
  /// **'Credit available for usage'**
  String get credit_available_for_usage;

  /// No description provided for @charge_wallet.
  ///
  /// In en, this message translates to:
  /// **'Charge wallet'**
  String get charge_wallet;

  /// No description provided for @wallet_history.
  ///
  /// In en, this message translates to:
  /// **'Wallet History'**
  String get wallet_history;

  /// No description provided for @my_payment_methods.
  ///
  /// In en, this message translates to:
  /// **'My payment methods'**
  String get my_payment_methods;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @additional_location_data.
  ///
  /// In en, this message translates to:
  /// **'Additional location data'**
  String get additional_location_data;

  /// No description provided for @your_geographic_location_determines_the_services_available_in_your_area.
  ///
  /// In en, this message translates to:
  /// **'Your geographic location determines the services available in your area'**
  String get your_geographic_location_determines_the_services_available_in_your_area;

  /// No description provided for @your_location.
  ///
  /// In en, this message translates to:
  /// **'Your location'**
  String get your_location;

  /// No description provided for @location_is_required.
  ///
  /// In en, this message translates to:
  /// **'Location is required'**
  String get location_is_required;

  /// No description provided for @location_title_is_required.
  ///
  /// In en, this message translates to:
  /// **'Location title is required'**
  String get location_title_is_required;

  /// No description provided for @determine_title_for_address.
  ///
  /// In en, this message translates to:
  /// **'Determine the title for address'**
  String get determine_title_for_address;

  /// No description provided for @written_location_description.
  ///
  /// In en, this message translates to:
  /// **'Written location description'**
  String get written_location_description;

  /// No description provided for @optional.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get optional;

  /// No description provided for @confirm_data.
  ///
  /// In en, this message translates to:
  /// **'Confirm data'**
  String get confirm_data;

  /// No description provided for @password_updated_successfully.
  ///
  /// In en, this message translates to:
  /// **'Password updated successfully'**
  String get password_updated_successfully;

  /// No description provided for @password_changed_successfully.
  ///
  /// In en, this message translates to:
  /// **'Password changed successfully'**
  String get password_changed_successfully;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @confirmation_code.
  ///
  /// In en, this message translates to:
  /// **'Confirmation code'**
  String get confirmation_code;

  /// No description provided for @no_code_was_sent.
  ///
  /// In en, this message translates to:
  /// **'No code was sent?'**
  String get no_code_was_sent;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @password_confirmation_is_required.
  ///
  /// In en, this message translates to:
  /// **'Password confirmation is required'**
  String get password_confirmation_is_required;

  /// No description provided for @confirm_new_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm new password'**
  String get confirm_new_password;

  /// No description provided for @passwords_are_not_identical.
  ///
  /// In en, this message translates to:
  /// **'Passwords are not identical'**
  String get passwords_are_not_identical;

  /// No description provided for @jeebly_version.
  ///
  /// In en, this message translates to:
  /// **'Jeebly version'**
  String get jeebly_version;

  /// No description provided for @jeebly_about.
  ///
  /// In en, this message translates to:
  /// **'Jeebly is a delivery app, made in Africa for Africa'**
  String get jeebly_about;

  /// No description provided for @alert.
  ///
  /// In en, this message translates to:
  /// **'Alert'**
  String get alert;

  /// No description provided for @are_u_sure_u_wanna_delete_ur_acc.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account?'**
  String get are_u_sure_u_wanna_delete_ur_acc;

  /// No description provided for @account_deletion_will_result_in_all_related_data_deletion.
  ///
  /// In en, this message translates to:
  /// **'Account Deletion Will Result In All Related Data Deletion.'**
  String get account_deletion_will_result_in_all_related_data_deletion;

  /// No description provided for @go_back.
  ///
  /// In en, this message translates to:
  /// **'Go back'**
  String get go_back;

  /// No description provided for @noWhatsAppAvailable.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp number not available'**
  String get noWhatsAppAvailable;

  /// No description provided for @failedToOpenWhatsApp.
  ///
  /// In en, this message translates to:
  /// **'Failed to open WhatsApp'**
  String get failedToOpenWhatsApp;

  /// No description provided for @noFacebookAvailable.
  ///
  /// In en, this message translates to:
  /// **'Facebook link not available'**
  String get noFacebookAvailable;

  /// No description provided for @failedToOpenFacebook.
  ///
  /// In en, this message translates to:
  /// **'Failed to open Facebook'**
  String get failedToOpenFacebook;

  /// No description provided for @noInstagramAvailable.
  ///
  /// In en, this message translates to:
  /// **'Instagram username not available'**
  String get noInstagramAvailable;

  /// No description provided for @failedToOpenInstagram.
  ///
  /// In en, this message translates to:
  /// **'Failed to open Instagram'**
  String get failedToOpenInstagram;

  /// No description provided for @noTwitterAvailable.
  ///
  /// In en, this message translates to:
  /// **'Twitter username not available'**
  String get noTwitterAvailable;

  /// No description provided for @failedToOpenTwitter.
  ///
  /// In en, this message translates to:
  /// **'Failed to open Twitter'**
  String get failedToOpenTwitter;

  /// No description provided for @noSnapchatAvailable.
  ///
  /// In en, this message translates to:
  /// **'Snapchat username not available'**
  String get noSnapchatAvailable;

  /// No description provided for @failedToOpenSnapchat.
  ///
  /// In en, this message translates to:
  /// **'Failed to open Snapchat'**
  String get failedToOpenSnapchat;

  /// No description provided for @noTelegramAvailable.
  ///
  /// In en, this message translates to:
  /// **'Telegram identifier not available'**
  String get noTelegramAvailable;

  /// No description provided for @failedToOpenTelegram.
  ///
  /// In en, this message translates to:
  /// **'Failed to open Telegram'**
  String get failedToOpenTelegram;

  /// No description provided for @noLinkedInAvailable.
  ///
  /// In en, this message translates to:
  /// **'LinkedIn link not available'**
  String get noLinkedInAvailable;

  /// No description provided for @failedToOpenLinkedIn.
  ///
  /// In en, this message translates to:
  /// **'Failed to open LinkedIn'**
  String get failedToOpenLinkedIn;

  /// No description provided for @noEmailAvailable.
  ///
  /// In en, this message translates to:
  /// **'Email not available'**
  String get noEmailAvailable;

  /// No description provided for @failedToOpenEmail.
  ///
  /// In en, this message translates to:
  /// **'Failed to open email'**
  String get failedToOpenEmail;

  /// No description provided for @noPhoneNumberAvailable.
  ///
  /// In en, this message translates to:
  /// **'Phone number not available'**
  String get noPhoneNumberAvailable;

  /// No description provided for @failedToOpenPhoneDialer.
  ///
  /// In en, this message translates to:
  /// **'Failed to open phone dialer'**
  String get failedToOpenPhoneDialer;

  /// No description provided for @noWebsiteAvailable.
  ///
  /// In en, this message translates to:
  /// **'Website link not available'**
  String get noWebsiteAvailable;

  /// No description provided for @failedToOpenWebsite.
  ///
  /// In en, this message translates to:
  /// **'Failed to open website'**
  String get failedToOpenWebsite;

  /// No description provided for @chooseFileType.
  ///
  /// In en, this message translates to:
  /// **'Choose file type'**
  String get chooseFileType;

  /// No description provided for @choosePdf.
  ///
  /// In en, this message translates to:
  /// **'Choose PDF file'**
  String get choosePdf;

  /// No description provided for @onlyPdfAllowed.
  ///
  /// In en, this message translates to:
  /// **'Only PDF files are allowed'**
  String get onlyPdfAllowed;

  /// No description provided for @nameMustBeNotEmpty.
  ///
  /// In en, this message translates to:
  /// **'Name must not be empty'**
  String get nameMustBeNotEmpty;

  /// No description provided for @invalidName.
  ///
  /// In en, this message translates to:
  /// **'Invalid name'**
  String get invalidName;

  /// No description provided for @usernameCannotBeOnlySpaces.
  ///
  /// In en, this message translates to:
  /// **'Username cannot contain only spaces'**
  String get usernameCannotBeOnlySpaces;

  /// No description provided for @usernameCannotStartWithSpace.
  ///
  /// In en, this message translates to:
  /// **'Username cannot start with a space'**
  String get usernameCannotStartWithSpace;

  /// No description provided for @emailMustBeNotEmpty.
  ///
  /// In en, this message translates to:
  /// **'Email must not be empty'**
  String get emailMustBeNotEmpty;

  /// No description provided for @enter_vaild_email.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get enter_vaild_email;

  /// No description provided for @please_enter_password.
  ///
  /// In en, this message translates to:
  /// **'Please enter password'**
  String get please_enter_password;

  /// No description provided for @password_length.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get password_length;

  /// No description provided for @passwordMissingUppercase.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one uppercase letter'**
  String get passwordMissingUppercase;

  /// No description provided for @passwordMissingLowercase.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one lowercase letter'**
  String get passwordMissingLowercase;

  /// No description provided for @passwordMissingDigit.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one digit'**
  String get passwordMissingDigit;

  /// No description provided for @passwordMissingSpecialChar.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one special character (!@#\$%^&*)'**
  String get passwordMissingSpecialChar;

  /// No description provided for @password_not_match.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get password_not_match;

  /// No description provided for @phoneNumberEmpty.
  ///
  /// In en, this message translates to:
  /// **'Phone number is empty'**
  String get phoneNumberEmpty;

  /// No description provided for @phoneNumberLength.
  ///
  /// In en, this message translates to:
  /// **'Phone number must be 11 digits'**
  String get phoneNumberLength;

  /// No description provided for @invalidPhoneNumberFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number format'**
  String get invalidPhoneNumberFormat;

  /// No description provided for @locationEmpty.
  ///
  /// In en, this message translates to:
  /// **'Location is empty'**
  String get locationEmpty;

  /// No description provided for @fieldEmpty.
  ///
  /// In en, this message translates to:
  /// **'Field is empty'**
  String get fieldEmpty;

  /// No description provided for @timeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Time is empty'**
  String get timeEmpty;

  /// No description provided for @invalidTime.
  ///
  /// In en, this message translates to:
  /// **'Invalid time'**
  String get invalidTime;

  /// No description provided for @invalidAge.
  ///
  /// In en, this message translates to:
  /// **'Invalid age'**
  String get invalidAge;

  /// No description provided for @countryEmpty.
  ///
  /// In en, this message translates to:
  /// **'Country is empty'**
  String get countryEmpty;

  /// No description provided for @cityEmpty.
  ///
  /// In en, this message translates to:
  /// **'City is empty'**
  String get cityEmpty;

  /// No description provided for @nationalIdEmpty.
  ///
  /// In en, this message translates to:
  /// **'National ID is empty'**
  String get nationalIdEmpty;

  /// No description provided for @invalidNationalId.
  ///
  /// In en, this message translates to:
  /// **'Invalid national ID'**
  String get invalidNationalId;

  /// No description provided for @onlyEnglishDigits.
  ///
  /// In en, this message translates to:
  /// **'Only English digits are allowed'**
  String get onlyEnglishDigits;

  /// No description provided for @theAccountHasBeenCreated.
  ///
  /// In en, this message translates to:
  /// **'The account has been created successfully'**
  String get theAccountHasBeenCreated;

  /// No description provided for @loginSuccess.
  ///
  /// In en, this message translates to:
  /// **'Login successful'**
  String get loginSuccess;

  /// No description provided for @no_results_found.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get no_results_found;

  /// No description provided for @min.
  ///
  /// In en, this message translates to:
  /// **'min'**
  String get min;

  /// No description provided for @looking_for_a_specific_product.
  ///
  /// In en, this message translates to:
  /// **'Looking for a specific product?'**
  String get looking_for_a_specific_product;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
