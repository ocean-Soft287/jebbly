import 'package:equatable/equatable.dart';

import '../data/model/address_model.dart';

sealed class AddressesEvent extends Equatable {
  const AddressesEvent();
}

class SelectAddressEvent extends AddressesEvent {
  final AddressModel address;

  const SelectAddressEvent(this.address);

  @override
  List<Object?> get props => [address];
}

// GET: fetch all addresses
class GetAddressesEvent extends AddressesEvent {
  const GetAddressesEvent();

  @override
  List<Object?> get props => [];
}

// POST: add a new address
class AddAddressEvent extends AddressesEvent {
  final String title;
  final String details;
  final String lng;
  final String lat;

  const AddAddressEvent({
    required this.title,
    required this.details,
    required this.lng,
    required this.lat,
  });

  @override
  List<Object?> get props => [title, details, lng, lat];
}

class UpdateAddressEvent extends AddressesEvent {
  final int id;
  final String title;
  final String details;
  final String lng;
  final String lat;

  const UpdateAddressEvent({
    required this.id,
    required this.title,
    required this.details,
    required this.lng,
    required this.lat,
  });

  @override
  List<Object?> get props => [id, title, details, lng, lat];
}

class DeleteAddressEvent extends AddressesEvent {
  final int id;

  const DeleteAddressEvent(this.id);

  @override
  List<Object?> get props => [id];
}
