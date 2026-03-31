

import '../../../../../core/http/either.dart';
import '../../../../../core/http/endpoints.dart';
import '../../../../../core/http/failure.dart';
import '../../../../../core/http/generic_data_source.dart';
import '../models/account_model.dart';

abstract interface class AccountDataSource {
  Future<Either<Failure, AccountModel>> getProfile();
}

class AccountDataSourceImpl implements AccountDataSource {
  final GenericDataSource genericDataSource;

  AccountDataSourceImpl(this.genericDataSource);

  @override
  Future<Either<Failure, AccountModel>> getProfile() async {
    return await genericDataSource.fetchResult<AccountModel>(
      endpoint: Endpoints.getProfile,
      fromJson: (json) => AccountModel.fromJson(json),
    );
  }
}
