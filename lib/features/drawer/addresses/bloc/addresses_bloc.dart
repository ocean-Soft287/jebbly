import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/core/bloc/base_bloc.dart';
import 'package:jeebly_mobile/features/drawer/addresses/bloc/addresses_event.dart';
import 'package:jeebly_mobile/features/drawer/addresses/data/datasource/addresses_datasource.dart';
import 'package:jeebly_mobile/features/drawer/addresses/data/model/address_model.dart';

class AddressesBloc extends Bloc<AddressesEvent, BaseState<AddressModel>> {
  final AddressesDatasource datasource;

  AddressesBloc(this.datasource) : super(const BaseState()) {
    on<GetAddressesEvent>(_onGetAddresses);
    on<AddAddressEvent>(_onAddAddress);
  }

  Future<void> _onGetAddresses(
    GetAddressesEvent event,
    Emitter<BaseState<AddressModel>> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    final response = await datasource.getAddresses();
    response.fold(
      (failure) => emit(state.copyWith(
        status: Status.failure,
        failure: failure,
        errorMessage: failure.message,
      )),
      (addresses) => emit(state.copyWith(
        status: Status.success,
        items: addresses,
      )),
    );
  }

  Future<void> _onAddAddress(
    AddAddressEvent event,
    Emitter<BaseState<AddressModel>> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    final response = await datasource.addAddress(
      title: event.title,
      details: event.details,
      lng: event.lng,
      lat: event.lat,
    );
    response.fold(
      (failure) => emit(state.copyWith(
        status: Status.failure,
        failure: failure,
        errorMessage: failure.message,
      )),
      (_) => emit(state.copyWith(status: Status.success)),
    );
  }
}
