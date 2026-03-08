import 'package:jeebly_mobile/core/http/either.dart';
import 'package:jeebly_mobile/core/http/endpoints.dart';
import 'package:jeebly_mobile/core/http/failure.dart';
import 'package:jeebly_mobile/core/http/generic_data_source.dart';

abstract interface class RegisterDataSource {
  Future<Either<Failure, Map<String, dynamic>>> register({
    required String fullName,
    required String password,
    required String phoneNumber,
  });
}

class RegisterDataSourceImpl implements RegisterDataSource {
  final GenericDataSource genericDataSource;

  RegisterDataSourceImpl(this.genericDataSource);

  @override
  Future<Either<Failure, Map<String, dynamic>>> register({
    required String fullName,
    required String password,
    required String phoneNumber,
  }) async {
    return await genericDataSource.postData<Map<String, dynamic>>(
      endpoint: Endpoints.register,
      fromJson: (json) => json,
      data: {
        'fullName': fullName,
        'password': password,
        'phoneNumber': phoneNumber,
      },
    );
  }
}
