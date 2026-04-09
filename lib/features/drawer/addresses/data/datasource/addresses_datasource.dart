import 'package:jeebly_mobile/core/http/either.dart';
import 'package:jeebly_mobile/core/http/endpoints.dart';
import 'package:jeebly_mobile/core/http/failure.dart';
import 'package:jeebly_mobile/core/http/generic_data_source.dart';
import 'package:jeebly_mobile/features/drawer/addresses/data/model/address_model.dart';

abstract interface class AddressesDatasource {
  Future<Either<Failure, List<AddressModel>>> getAddresses();

  Future<Either<Failure, void>> addAddress({
    required String title,
    required String details,
    required String lng,
    required String lat,
  });

  Future<Either<Failure, void>> updateAddress({
    required int id,
    required String title,
    required String details,
    required String lng,
    required String lat,
  });

  Future<Either<Failure, void>> deleteAddress(int id);
}

class AddressesDatasourceImpl implements AddressesDatasource {
  final GenericDataSource _dataSource;

  const AddressesDatasourceImpl(this._dataSource);

  @override
  Future<Either<Failure, List<AddressModel>>> getAddresses() async {
    return _dataSource.fetchData<AddressModel>(
      endpoint: Endpoints.getAddresses,
      fromJson: AddressModel.fromJson,
    );
  }

  @override
  Future<Either<Failure, void>> addAddress({
    required String title,
    required String details,
    required String lng,
    required String lat,
  }) async {
    return _dataSource.postData<void>(
      endpoint: Endpoints.addAddress,
      data: {
        'title': title,
        'description': details,
        'lat': lat,
        'lng': lng,
      },
    );
  }

  @override
  Future<Either<Failure, void>> updateAddress({
    required int id,
    required String title,
    required String details,
    required String lng,
    required String lat,
  }) async {
    return _dataSource.updateData<void>(
      endpoint: Endpoints.updateAddress(id: id),
      data: {
        'title': title,
        'details': details,
        'governorate': lng,
        'district': lat,
      },
    );
  }

  @override
  Future<Either<Failure, void>> deleteAddress(int id) async {
    return _dataSource.deleteData<void>(
      endpoint: Endpoints.deleteAddress(id: id),
    );
  }
}
