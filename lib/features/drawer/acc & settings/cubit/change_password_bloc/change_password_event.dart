import 'package:equatable/equatable.dart';

class ChangePasswordEvent extends Equatable {
  final String oldPassword;
  final String phone;
  final String newPassword;
  final String confirmNewPassword;

  const ChangePasswordEvent(
      {required this.oldPassword,
      required this.phone,
      required this.newPassword,
      required this.confirmNewPassword});

  @override
  List<Object?> get props =>
      [oldPassword, phone, newPassword, confirmNewPassword];
}
