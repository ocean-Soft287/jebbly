import 'package:dio/dio.dart';
import 'package:jeebly_mobile/core/helpers/logger.dart';
import 'package:jeebly_mobile/core/http/either.dart';
import 'package:jeebly_mobile/core/http/endpoints.dart';
import 'package:jeebly_mobile/core/http/failure.dart';
import 'package:jeebly_mobile/core/http/generic_data_source.dart';
import 'package:jeebly_mobile/core/local_storage/local_storage.dart';
import 'package:jeebly_mobile/features/auth/data/models/user_model.dart';
import 'package:jeebly_mobile/core/service_locator/setup_get.dart';

import '../models/user_token.dart';

abstract interface class LoginDataSource {
  Future<Either<Failure, UserToken>> login(
    String password,
    String phone,
  );
}

class LoginDataSourceImpl implements LoginDataSource {
  final GenericDataSource genericDataSource;

  LoginDataSourceImpl(this.genericDataSource);

  @override
  Future<Either<Failure, UserToken>> login(
    String password,
    String phone,
  ) async {
    final result = await genericDataSource.postData<Map<String, dynamic>>(
      endpoint: Endpoints.login,
      fromJson: (json) => json,
      data: {
        'password': password,
        'phoneNumber': phone,
      },
    );
    return result.fold((fail) => Left(fail), (right) async {
      try {
        final token = UserToken.fromJson(right);
        final user = UserModel.fromJson(right);
        
        await getIt<ITokenCache>().saveAccessToken(token);
        await getIt<IUserCache>().cacheUserModel(user);
        
        getIt<Dio>()
            .options
            .headers
            .addAll({"Authorization": "Bearer ${token.accessToken}"});
            
        logger(getIt<ITokenCache>().getAccessToken());
        return Right(token);
      } catch (e) {
        return Left(CacheFailure(message: e.toString()));
      }
    });
  }
  
}
