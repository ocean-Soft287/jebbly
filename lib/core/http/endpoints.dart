abstract interface class Endpoints {
  static const String baseUrl = 'https://jeebly.runasp.net/';

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
  static String getCategories({required String id}) => 'api/Services/$id/Categories';
  static String getRestaurants({required String categoryId}) => 'api/Services/$categoryId/restaurants';
  static String getRestaurantDetails({required String restaurantId}) => 'api/AddRestaurant/$restaurantId/RestaurantById';

  // ***************************** Ads *******************************
  static const String ads = 'api/UploadImages/service';


  // ***************************** Restaurants *******************************
  static const String getAllRestaurants = 'api/AddRestaurant/getAllResturant';
  static const String searchRestaurants = '/api/RestaurantClient/search';
  static const String highRatedRestaurants = 'api/AddRestaurant/HighRatedResturants';
}
