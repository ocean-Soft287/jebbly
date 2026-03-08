import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/core/bloc/base_bloc.dart';
import 'package:jeebly_mobile/features/auth/data/repo/register_data_source.dart';

class RegisterCubit extends Cubit<BaseState<void>> {
  final RegisterDataSource registerDataSource;

  RegisterCubit(this.registerDataSource) : super(BaseState());

  Future<void> register({
    required String fullName,
    required String password,
    required String phoneNumber,
  }) async {
    emit(state.copyWith(status: Status.loading));
    final result = await registerDataSource.register(
      fullName: fullName,
      password: password,
      phoneNumber: phoneNumber,
    );
    result.fold(
      (failure) => emit(state.copyWith(
        status: Status.failure,
        errorMessage: failure.message,
      )),
      (data) => emit(state.copyWith(status: Status.success)),
    );
  }
}
