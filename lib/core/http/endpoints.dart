abstract interface class Endpoints {
  static const String baseUrl = 'https://jebbly.runasp.net/';

  // ****************************** Auth ********************************
  static const String register = 'api/AuthClient/register';
  static const String login = 'api/AuthClient/login';
  static const String changePassword = 'api/AuthClient/change-password';
  static const String refreshToken = 'api/refreshToken';

  // ****************************** Addresses ********************************
  static const String getAddresses = 'api/addresses/GetAddresses';
  static const String addAddress = 'api/addresses/CreateAddress';
  static  String updateAddress( {required int id})=> 'api/Addresses/$id/UpdateAddress';
  static  String deleteAddress( {required int id})=> 'api/Addresses/$id/DeleteAddress';

  // ****************************** Profile ********************************
  static const String getProfile = '/api/Account/profile';



  // ***************************** Categories *******************************
  static String getCategories({required int id}) => 'api/Services/$id/Categories';
  static String getRestaurantDetails({required int restaurantId}) => 'api/AddRestaurant/$restaurantId/RestaurantById';
  static String getRestaurantCategories({required int restaurantId}) => 'api/CategoriesClient/$restaurantId/Categories';
  static const String getProducts = 'api/CategoriesClient/Products';

  // ***************************** Ads *******************************
  static const String ads = 'api/UploadImages/service';


  // ***************************** Restaurants *******************************
  static const String getAllRestaurants = 'api/AddRestaurant/getAllResturant';//
  static String getRestaurantsByCategory({required String categoryId}) => 'api/CategoriesClient/$categoryId/restaurants';

  static const String searchRestaurants = '/api/RestaurantClient/search';
  static const String highRatedRestaurants = 'api/AddRestaurant/HighRatedResturants';

  // ***************************** Cart *******************************
  static  String addToCart({required int productId}) => 'api/Cart/add/$productId';
}
