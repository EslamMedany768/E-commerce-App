import 'package:e_commerce_app/data/model/CategoryOrBrandDm.dart';
import 'package:e_commerce_app/domain/entities/CategoryOrBrandEntity.dart';

abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class CategoryLoadingState extends HomeTabStates {}

class CategoryErrorState extends HomeTabStates {
  String error;

  CategoryErrorState({required this.error});
}

class CategorySuccessState extends HomeTabStates {


  CategorySuccessState();
}

class BrandLoadingState extends HomeTabStates {}

class BrandErrorState extends HomeTabStates {
  String error;

  BrandErrorState({required this.error});
}

class BrandSuccessState extends HomeTabStates {

}
