import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/core/bloc/base_bloc.dart';
import 'package:jeebly_mobile/features/home/bloc/ads_event.dart';
import 'package:jeebly_mobile/features/home/data/datasource/ads_datasource.dart';
import 'package:jeebly_mobile/features/home/data/models/ad_model.dart';

class AdsBloc extends Bloc<AdsEvent, BaseState<AdModel>> {
  final AdsDataSource datasource;

  AdsBloc(this.datasource) : super(const BaseState()) {
    on<GetAdsEvent>(_onGetAds);
  }

  Future<void> _onGetAds(
    GetAdsEvent event,
    Emitter<BaseState<AdModel>> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    final response = await datasource.getAds();
    response.fold(
      (failure) => emit(state.copyWith(
        status: Status.failure,
        failure: failure,
        errorMessage: failure.message,
      )),
      (ads) => emit(state.copyWith(
        status: Status.success,
        items: ads,
      )),
    );
  }
}
