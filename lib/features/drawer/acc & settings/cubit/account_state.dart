import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/data/models/account_model.dart';

sealed class AccountState {}

final class AccountInitial extends AccountState {}

final class AccountLoading extends AccountState {}

final class AccountSuccess extends AccountState {
  final AccountModel accountModel;
  AccountSuccess(this.accountModel);
}

final class AccountFailure extends AccountState {
  final String message;
  AccountFailure(this.message);
}

final class ImageChanged extends AccountState {}

final class PasswordVisibilityToggled extends AccountState {}

final class UpdatePasswordSuccessState extends AccountState {}