import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';

class CartStates {}

// class CartInitialStates extends CartStates{}

class CartLoadingStates extends CartStates {}

class CartSuccessStates extends CartStates {
  GetCartResponseEntity cartItems;

  CartSuccessStates({required this.cartItems});
}

class CartErrorStates extends CartStates {
  String error;

  CartErrorStates({required this.error});
}

class CartDeleteSuccessStates extends CartStates {
  GetCartResponseEntity cartItems;
  CartDeleteSuccessStates({required this.cartItems});
}

class CartDeleteErrorStates extends CartStates {
  String error;
  CartDeleteErrorStates({required this.error});
}
class CartUpdateSuccessStates extends CartStates {
  GetCartResponseEntity cartItems;
  CartUpdateSuccessStates({required this.cartItems});
}

class CartUpdateErrorStates extends CartStates {
  String error;
  CartUpdateErrorStates({required this.error});
}
