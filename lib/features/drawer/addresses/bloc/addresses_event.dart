import 'package:equatable/equatable.dart';

sealed class AddressesEvent extends Equatable {
  const AddressesEvent();
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
