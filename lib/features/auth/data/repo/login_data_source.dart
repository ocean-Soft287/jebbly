import 'package:dio/dio.dart';
import 'package:jeebly_mobile/core/helpers/logger.dart';
import 'package:jeebly_mobile/core/http/either.dart';
import 'package:jeebly_mobile/core/http/endpoints.dart';
import 'package:jeebly_mobile/core/http/failure.dart';
import 'package:jeebly_mobile/core/http/generic_data_source.dart';
import 'package:jeebly_mobile/core/local_storage/local_storage.dart';
import 'package:jeebly_mobile/core/service_locator/setup_get.dart';

abstract interface class LoginDataSource {
  Future<Either<Failure, String>> login(
    String password,
    String phone,
    String deviceToken,
  );
}

class LoginDataSourceImpl implements LoginDataSource {
  final GenericDataSource genericDataSource;

  LoginDataSourceImpl(this.genericDataSource);

  @override
  Future<Either<Failure, String>> login(
    String password,
    String phone,
    String deviceToken,
  ) async {
    final result = await genericDataSource.postData(
      endpoint: Endpoints.login,
      data: {
        'password': password,
        'phoneNumber': phone,
        'device_token': deviceToken,
      },
    );
    return result.fold((fail) => Left(fail), (right) async {
      try {
        await getIt<ITokenCache>().saveAccessToken(right);
        getIt<Dio>()
            .options
            .headers
            .addAll({"Authorization": "Bearer ${right.accessToken}"});
        logger(getIt<ITokenCache>().getAccessToken());
        return Right(right);
      } catch (e) {
        return Left(CacheFailure(message: e.toString()));
      }
    });
  }
  
}
