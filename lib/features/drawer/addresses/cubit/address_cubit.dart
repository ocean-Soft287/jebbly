import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/features/drawer/addresses/cubit/address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());
  static AddressCubit get(context) => BlocProvider.of(context);
  var formKey = GlobalKey<FormState>();

  validateToUpdateAddress() {
    if (formKey.currentState!.validate()) updateAddress();
  }

  updateAddress() {
    emit(AddressUpdated());
  }
}