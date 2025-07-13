import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/widgets/custom_network_image.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/cubit/account_state.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountInitial());
  static AccountCubit get(context) => BlocProvider.of(context);

  Widget userImage = CustomNetworkImage(
      radius: 999999999999999,
      width: 100.sp,
      height: 100.sp,
      url:
          'https://images.unsplash.com/photo-1633332755192-727a05c4013d?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D');

  var accountDataFormKey = GlobalKey<FormState>();
  var passwordFormKey = GlobalKey<FormState>();

  bool oldPasswordHidden = true;
  bool newPasswordHidden = true;
  bool newPasswordConfirmationHidden = true;

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  toggleOldPassword() {
    oldPasswordHidden = !oldPasswordHidden;
    emit(PasswordVisibilityToggled());
  }

  toggleNewPassword() {
    newPasswordHidden = !newPasswordHidden;
    emit(PasswordVisibilityToggled());
  }

  toggleNewPasswordConfirmationVisibility() {
    newPasswordConfirmationHidden = !newPasswordConfirmationHidden;
    emit(PasswordVisibilityToggled());
  }

  changeUserImage(Widget image) {
    userImage = image;
    emit(ImageChanged());
  }

  validateToSaveChanges() {
    if (accountDataFormKey.currentState!.validate()) return;
  }

  validateToChangePassword() {
    if (passwordFormKey.currentState!.validate()) updatePassword();
  }

  updatePassword() {
    emit(UpdatePasswordSuccessState());
  }

  goToFacebookPage() async {
    var facebookUrl = "https://www.facebook.com/jeebly.ly";
    launchUrl(Uri.parse(facebookUrl));
  }
}