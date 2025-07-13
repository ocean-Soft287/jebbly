import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jeebly_mobile/core/apis/api_constants.dart';

class DioHelper {
  DioHelper._privateConstructor();

  static final DioHelper instance = DioHelper._privateConstructor();

  final Dio _dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      followRedirects: false,
      validateStatus: (status) {
        return status! <= 500;
      }));

  Dio get dio => _dio;

  Future<bool> _hasInternetConnection() async {
    return await InternetConnectionChecker().hasConnection;
  }

  Future<Response?> postData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    // Check internet connection before making the request
    if (!await _hasInternetConnection()) {
      throw DioException(
          requestOptions: RequestOptions(path: url),
          error: 'noInternetConnection');
    }

    try {
      return await dio.post(url,
          data: data, queryParameters: queryParameters, options: options);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw DioException(
            requestOptions: e.requestOptions, error: 'noInternetConnection');
      }
      return e.response;
    }
  }

  Future<Response?> putData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    if (!await _hasInternetConnection()) {
      throw DioException(
          requestOptions: RequestOptions(path: url),
          error: 'noInternetConnection');
    }

    try {
      return await dio.put(url,
          data: data, queryParameters: queryParameters, options: options);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw DioException(
            requestOptions: e.requestOptions, error: 'noInternetConnection');
      }
      return e.response;
    }
  }

  Future<Response?> getData(
      {required String url,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    if (!await _hasInternetConnection()) {
      throw DioException(
          requestOptions: RequestOptions(path: url),
          error: 'noInternetConnection');
    }

    try {
      return await dio.get(url,
          queryParameters: queryParameters, options: options);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw DioException(
            requestOptions: e.requestOptions, error: 'noInternetConnection');
      }
      return e.response;
    }
  }

  Future<Response?> deleteData({
    required String url,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    if (!await _hasInternetConnection()) {
      throw DioException(
          requestOptions: RequestOptions(path: url),
          error: 'noInternetConnection');
    }

    try {
      return await dio.delete(url,
          queryParameters: queryParameters, options: options);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw DioException(
            requestOptions: e.requestOptions, error: 'noInternetConnection');
      }
      return e.response;
    }
  }
}