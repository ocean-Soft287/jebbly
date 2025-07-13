sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSuccessState extends AuthState {}

final class ConfirmButtonActivatedState extends AuthState {}

final class ConfirmButtonDeactivatedState extends AuthState {}

final class CodeConfirmedState extends AuthState {}

final class PasswordVisibilityToggledState extends AuthState {}