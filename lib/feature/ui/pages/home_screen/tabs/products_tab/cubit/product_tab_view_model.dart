import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/use_cases/add_to_cart.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_products.dart';
import 'package:e_commerce_app/feature/ui/pages/home_screen/tabs/products_tab/cubit/product_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductTabViewModel extends Cubit<ProductTabStates> {
  GetAllProductsUseCase getAllProductsUseCase;
  AddToCartUseCase addToCartUseCase;
  int numOfItemsInCart=0;
  ProductTabViewModel({
    required this.getAllProductsUseCase,
    required this.addToCartUseCase,
  }) : super(ProductTabInitialStates());

  /// hold data & handle logic
  getAllProducts() async {
    emit(ProductTabLoadingStates());
    var either = await getAllProductsUseCase.invoke();
    either.fold(
      (error) {
        return emit(ProductTabErrorStates(errorName: error.errorName));
      },
      (response) {
        return emit(ProductTabSuccessStates(productsList: response.data!));
      },
    );
  }

  addToCart(String productId) async {

    var either = await addToCartUseCase.invoke(productId);
    either.fold(
      (error) {
        print(error.errorName);
        return emit(AddToCartErrorStates(errorName: error.errorName));
      },
      (response) {
        numOfItemsInCart=response.numOfCartItems!.toInt();
        print("num of items in cart : $numOfItemsInCart");
        return emit(AddToCartSuccessStates(productResponse: response));
      },
    );
  }
}
