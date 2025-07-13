import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/features/drawer/wallet/cubit/wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletInitial());
  static WalletCubit get(context) => BlocProvider.of(context);
  int? selectedPaymentMethod;

  selectPaymentMethod(int paymentMethodId) {
    selectedPaymentMethod = paymentMethodId;
    emit(PaymentMethodSelectedState());
  }
}
