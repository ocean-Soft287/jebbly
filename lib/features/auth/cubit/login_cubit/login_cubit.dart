import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/core/bloc/base_bloc.dart';
import 'package:jeebly_mobile/features/auth/data/repo/login_data_source.dart';



class LoginCubit extends Cubit<BaseState<void>> {
  final LoginDataSource loginDataSource;
  LoginCubit(this.loginDataSource) : super(BaseState());
  Future<void> login(String password, String phone,) async {
    emit(state.copyWith(status: Status.loading));
    final result = await loginDataSource.login(password, phone);
    result.fold(
      (failure) => emit(state.copyWith(
          status: Status.failure, errorMessage: failure.message)),
      (data) => emit(state.copyWith(status: Status.success)),
    );
  }

}
