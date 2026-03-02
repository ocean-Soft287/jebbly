import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:jeebly_mobile/core/cache_manager/cache_manager.dart';
import 'package:jeebly_mobile/core/http/api_consumer.dart';
import 'package:jeebly_mobile/core/http/base_api_consumer.dart';
import 'package:jeebly_mobile/core/http/connectivity_service.dart';
import 'package:jeebly_mobile/core/http/endpoints.dart';
import 'package:jeebly_mobile/core/http/generic_data_source.dart';
import 'package:jeebly_mobile/core/http/sync_manager.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class SharedServiceLocator {
  static Future<void> execute({required GetIt getIt}) async {
    final token = await CacheManager.getAccessToken();
    getIt.registerLazySingleton<Dio>(
      () {
        return Dio(
          BaseOptions(
            baseUrl: Endpoints.baseUrl,
            connectTimeout: const Duration(seconds: 60),
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              // Disable gzip/deflate from server to avoid malformed compressed responses
              'Accept-Encoding': 'identity',
              'Cache-Control': 'no-cache',
              'Pragma': 'no-cache',
              'Accept-Language': 'ar',
              //  AppRouter.router.configuration.navigatorKey
              //             .currentContext?.isArabic ??
              //         false
              //     ? 'ar'
              //     : 'en',

              'Authorization': 'Bearer $token',
            },
          ),
        )..interceptors.addAll(
            [
              if (kDebugMode)
                PrettyDioLogger(
                  logPrint: (object) {
                    log(object.toString());
                  },
                  requestHeader: true,
                  requestBody: true,
                  responseBody: true,
                  responseHeader: false,
                  error: true,
                  compact: true,
                  enabled: true,
                  request: true,
                  maxWidth: 90,
                ),
            ],
          );
      },
    );
    getIt.registerLazySingleton<ApiConsumer>(
        () => ApiConsumerImpl(dio: getIt<Dio>()));
    getIt.registerLazySingleton<GenericDataSource>(
        () => GenericDataSource(getIt<ApiConsumer>()));
    getIt.registerLazySingleton<SyncManager>(() => SyncManager());
    getIt.registerLazySingleton<ConnectivityService>(
        () => ConnectivityService.instance);

    // await AuthServiceLocator.execute(getIt: getIt);
  }
}
