import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/features/drawer/addresses/cubit/address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final formKey = GlobalKey<FormState>();

  // Controllers read by ConfirmAddressButton to build AddAddressEvent
  late final TextEditingController locationController;
  late final TextEditingController titleController;
  late final TextEditingController detailsController;

  String? lat;
  String? lng;

  AddressCubit({String? initialLocation, String? initialTitle, String? initialDetails}) : super(AddressInitial()) {
    locationController = TextEditingController(text: initialLocation);
    titleController = TextEditingController(text: initialTitle);
    detailsController = TextEditingController(text: initialDetails);
  }

  static AddressCubit get(context) => BlocProvider.of(context);

  @override
  Future<void> close() {
    locationController.dispose();
    titleController.dispose();
    detailsController.dispose();
    return super.close();
  }

  bool validateForm() => formKey.currentState?.validate() ?? false;

  void updateLocation({required String address, required String lat, required String lng}) {
    locationController.text = address;
    this.lat = lat;
    this.lng = lng;
    emit(AddressUpdated()); // Use existing state or create a new one if needed
  }

  /// Legacy helper kept for backward compatibility
  validateToUpdateAddress() {
    if (formKey.currentState!.validate()) updateAddress();
  }

  updateAddress() {
    emit(AddressUpdated());
  }
}