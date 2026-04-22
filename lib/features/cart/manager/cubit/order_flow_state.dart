sealed class OrderFlowState {}

final class OrderFlowInitial extends OrderFlowState {}

final class DeliveryToggledState extends OrderFlowState {}

final class PaymentMethodSelectedState extends OrderFlowState {}