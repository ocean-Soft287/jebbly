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
    on<UpdateAddressEvent>(_onUpdateAddress);
    on<DeleteAddressEvent>(_onDeleteAddress);
    on<SelectAddressEvent>(_onSelectAddress);
  }

  void _onSelectAddress(SelectAddressEvent event, Emitter<BaseState<AddressModel>> emit) {
    emit(state.copyWith(data: event.address));
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
      (addresses) {
        AddressModel? selectedAddress = state.data;
        // If no address is selected, pick the first one from the list
        if (selectedAddress == null && addresses.isNotEmpty) {
          selectedAddress = addresses.first;
        }
        emit(state.copyWith(
          status: Status.success,
          items: addresses,
          data: selectedAddress,
        ));
      },
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
    await response.fold(
      (failure) async => emit(state.copyWith(
        status: Status.failure,
        failure: failure,
        errorMessage: failure.message,
      )),
      (_) async => await _onGetAddresses(const GetAddressesEvent(), emit),
    );
  }

  Future<void> _onUpdateAddress(
    UpdateAddressEvent event,
    Emitter<BaseState<AddressModel>> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    final response = await datasource.updateAddress(
      id: event.id,
      title: event.title,
      details: event.details,
      lng: event.lng,
      lat: event.lat,
    );
    await response.fold(
      (failure) async => emit(state.copyWith(
        status: Status.failure,
        failure: failure,
        errorMessage: failure.message,
      )),
      (_) async => await _onGetAddresses(const GetAddressesEvent(), emit),
    );
  }

  Future<void> _onDeleteAddress(
    DeleteAddressEvent event,
    Emitter<BaseState<AddressModel>> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    final response = await datasource.deleteAddress(event.id);
    await response.fold(
      (failure) async => emit(state.copyWith(
        status: Status.failure,
        failure: failure,
        errorMessage: failure.message,
      )),
      (_) async => await _onGetAddresses(const GetAddressesEvent(), emit),
    );
  }
}
