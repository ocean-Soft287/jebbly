sealed class AccountState {}

final class AccountInitial extends AccountState {}

final class ImageChanged extends AccountState {}

final class PasswordVisibilityToggled extends AccountState {}

final class UpdatePasswordSuccessState extends AccountState {}