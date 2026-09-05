import 'package:e_commerce_app/domain/entities/AddProductResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/ProductResponseEntity.dart';

class ProductTabStates {}

class ProductTabInitialStates extends ProductTabStates {}

class ProductTabLoadingStates extends ProductTabStates {}

class ProductTabSuccessStates extends ProductTabStates {
  List<ProductEntity> productsList;

  ProductTabSuccessStates({required this.productsList});
}

class ProductTabErrorStates extends ProductTabStates {
  String errorName;

  ProductTabErrorStates({required this.errorName});
}

class AddToCartLoadingStates extends ProductTabStates {}

class AddToCartSuccessStates extends ProductTabStates {
  AddProductResponseEntity productResponse;

  AddToCartSuccessStates({required this.productResponse});
}

class AddToCartErrorStates extends ProductTabStates {
  String errorName;

  AddToCartErrorStates({required this.errorName});
}
