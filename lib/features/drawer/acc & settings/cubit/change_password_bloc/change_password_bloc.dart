import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/core/bloc/base_bloc.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/cubit/change_password_bloc/change_password_event.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/datasource/change_password_datasource.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, BaseState<void>> {
  final ChangePasswordDatasource datasource;

  ChangePasswordBloc(this.datasource) : super(const BaseState()) {
    on<ChangePasswordEvent>(_changePasswordEvent);
  }

  Future<void> _changePasswordEvent(
      ChangePasswordEvent event, Emitter<BaseState<void>> emit) async {
    emit(state.copyWith(status: Status.loading));
    final response = await datasource.changePassword(
        oldPassword: event.oldPassword,
        phone: event.phone,
        newPassword: event.newPassword,
        confirmNewPassword: event.confirmNewPassword);
    response.fold(
        (left) => emit(state.copyWith(
            failure: left, status: Status.failure, errorMessage: left.message)),
        (success) => emit(state.copyWith(
              status: Status.success,
            )));
  }
}
