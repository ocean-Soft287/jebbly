import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/features/home/restaurants/cubit/restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  RestaurantCubit() : super(RestaurantInitial());
  static RestaurantCubit get(context) => BlocProvider.of(context);

  bool deliverySelected = true;

  toggleDelivery() {
    deliverySelected = !deliverySelected;
    emit(DeliveryToggledState());
  }
}