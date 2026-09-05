import 'package:e_commerce_app/domain/use_cases/delete_cart_item.dart';
import 'package:e_commerce_app/domain/use_cases/get_cart_items_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/update_cart_item.dart';
import 'package:e_commerce_app/feature/ui/pages/cart_screen/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartViewModel extends Cubit<CartStates> {
  GetCartItemsUseCase getCartItemsUseCase;
  DeleteCartItemUseCase deleteCartItemUseCase;
  UpdateCartItemUseCase updateCartItemUseCase;

  CartViewModel({
    required this.getCartItemsUseCase,
    required this.deleteCartItemUseCase,
    required this.updateCartItemUseCase,
  }) : super(CartLoadingStates());

  getCartItem() async {
    emit(CartLoadingStates());
    var either = await getCartItemsUseCase.invoke();
    either.fold(
      (error) {
        emit(CartErrorStates(error: error.errorName));
      },
      (response) {
        emit(CartSuccessStates(cartItems: response));
        print(response.data!.products!.length);
      },
    );
  }

  deleteCartItem(String productId) async {
    var either = await deleteCartItemUseCase.invoke(productId);
    either.fold(
      (error) {
        emit(CartDeleteErrorStates(error: error.errorName));
      },
      (response) {
        emit(CartSuccessStates(cartItems: response));
      },
    );
  }

  updateCartItem(String productId,int count) async {
    var either = await updateCartItemUseCase.invoke(productId,count);
    either.fold(
      (error) {
        emit(CartUpdateErrorStates(error: error.errorName));
      },
      (response) {
        emit(CartUpdateSuccessStates(cartItems: response));
      },
    );
  }
}
