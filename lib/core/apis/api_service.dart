import 'package:jeebly_mobile/core/apis/api_constants.dart';
import 'package:retrofit/retrofit.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  // factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // @GET(ApiConstants.products)
  // Future<ProductsResponse> fetchLatestProducts(
  //     @Query("page") int page,
  //     @Query("limit") int limit,
  //     @Query("hasDiscount") bool? hasDiscount,
  //     @Query("searchField") String? searchField,
  //     @Query("categoryId[]") List<String>? categoryIds,
  //     @Query("countryId[]") List<String>? countryIds,
  //     @Query("packageType[]") List<String>? packagingTypes,
  //     @Query("minPrice") String? minPrice,
  //     @Query("maxPrice") String? maxPrice,
  //     @Query("rating") String? rating,
  //     @Query("sortBy") String? sortBy,
  //     @Query("sortOrder") String? sortOrder);
  //
  // @POST(ApiConstants.resetPassword)
  // Future<ResetPasswordResponse> resetPassword(
  //     @Header("Authorization") String token,
  //     @Body() ResetPasswordRequestBody body);
  //
  // @PATCH(ApiConstants.updateProfilePassword)
  // Future<UpdateProfilePassResponse> updateProfilePass(
  //   @Header("Authorization") String token,
  //   @Body() UpdatePassRequestBody body,
  // );
  //
  // @DELETE(ApiConstants.getProfile)
  // Future<DeleteProfileResponse> deleteProfile(
  //   @Header("Authorization") String token,
  // );
}