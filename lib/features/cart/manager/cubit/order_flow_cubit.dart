import 'package:flutter_bloc/flutter_bloc.dart';

import 'order_flow_state.dart';
class OrderFlowCubit extends Cubit<OrderFlowState> {
  OrderFlowCubit() : super(OrderFlowInitial());
  static OrderFlowCubit get(context) => BlocProvider.of(context);
  bool deliverySelected = true;
  int? selectedPaymentMethod;

  toggleDelivery() {
    deliverySelected = !deliverySelected;
    emit(DeliveryToggledState());
  }

  selectPaymentMethod(int paymentMethodId) {
    selectedPaymentMethod = paymentMethodId;
    emit(PaymentMethodSelectedState());
  }
}
