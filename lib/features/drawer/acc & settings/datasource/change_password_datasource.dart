import 'package:jeebly_mobile/core/http/endpoints.dart';
import 'package:jeebly_mobile/core/http/generic_data_source.dart';

import '../../../../core/http/either.dart';
import '../../../../core/http/failure.dart';

abstract interface class ChangePasswordDatasource {
  Future<Either<Failure, void>> changePassword({
    required String oldPassword,
    required String phone,
    required String newPassword,
    required String confirmNewPassword,
  });
}

class ChangePasswordDatasourceImpl implements ChangePasswordDatasource {
  final GenericDataSource _dataSource;

  const ChangePasswordDatasourceImpl(this._dataSource);

  @override
  Future<Either<Failure, void>> changePassword({
    required String oldPassword,
    required String phone,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    var result =
        await _dataSource.postData(endpoint: Endpoints.changePassword, data: {
      "oldPassword": oldPassword,
      "phoneNumber": phone,
      "newPassword": newPassword,
      "confirmNewPassword": confirmNewPassword
    });

    return result;
  }
}
//
// {
// "oldPassword": "Aa@12345",
// "phoneNumber": "01554827805",
// "newPassword": "Aa@123456",
// "confirmNewPassword": "Aa@123456"
// }
