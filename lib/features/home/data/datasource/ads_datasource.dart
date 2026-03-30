import 'package:jeebly_mobile/core/http/either.dart';
import 'package:jeebly_mobile/core/http/failure.dart';
import 'package:jeebly_mobile/core/http/generic_data_source.dart';
import 'package:jeebly_mobile/core/http/endpoints.dart';
import 'package:jeebly_mobile/features/home/data/models/ad_model.dart';

abstract interface class AdsDataSource {
  Future<Either<Failure, List<AdModel>>> getAds();
}

class AdsDataSourceImpl implements AdsDataSource {
  final GenericDataSource genericDataSource;

  AdsDataSourceImpl(this.genericDataSource);

  @override
  Future<Either<Failure, List<AdModel>>> getAds() async {
    return await genericDataSource.fetchData<AdModel>(
      endpoint: Endpoints.ads,
      fromJson: (json) => AdModel.fromJson(json),
    );
  }
}
