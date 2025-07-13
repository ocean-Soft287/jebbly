import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/core/helpers/functions/custom_logger.dart';
import 'package:jeebly_mobile/features/auth/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  //======= Login =======//
  var loginFormKey = GlobalKey<FormState>();
  validateToLogin() {
    if (loginFormKey.currentState!.validate()) login();
  }

  login() {
    emit(AuthSuccessState());
  }
  //==========================================================================//

  ///======= Password Recovery =======///
  bool confirmButtonActive = false, hiddenNewPassword = true, hiddenNewPasswordConfirmation = true;
  String confirmationCode = '';
  var resetPasswordFormKey = GlobalKey<FormState>();
  TextEditingController newPasswordController = TextEditingController();

  var enterPhoneFormKey = GlobalKey<FormState>();
  validateToRequestCode() {
    if (enterPhoneFormKey.currentState!.validate()) requestCode();
  }

  requestCode() {
    emit(AuthSuccessState());
  }

  activateConfirmButton(String code) {
    confirmButtonActive = true;
    confirmationCode = code;
    emit(ConfirmButtonActivatedState());
  }

  updateCode(String code) {
    CustomLogger.logger.f(code);
    CustomLogger.logger.i(code.length);
    code.length < 4 ? deactivateConfirmButton() : activateConfirmButton(code);
  }

  deactivateConfirmButton() {
    confirmButtonActive = false;
    emit(ConfirmButtonDeactivatedState());
  }

  confirmCode() async {
      emit(CodeConfirmedState());
  }

  toggleNewPasswordVisibility() {
    hiddenNewPassword = !hiddenNewPassword;
    emit(PasswordVisibilityToggledState());
  }

  toggleNewPasswordConfirmationVisibility() {
    hiddenNewPasswordConfirmation = !hiddenNewPasswordConfirmation;
    emit(PasswordVisibilityToggledState());
  }

  validateToResetPassword() {
    if (resetPasswordFormKey.currentState!.validate()) resetPassword();
  }

  resetPassword() {
    emit(AuthSuccessState());
  }
///==========================================================================///

  ///======= Sign Up =======///
  var signUpFormKey = GlobalKey<FormState>();
  validateToSignUp() {
    if (signUpFormKey.currentState!.validate()) signUp();
  }

  signUp() {
    emit(AuthSuccessState());
  }
  ///========================================================================///
}