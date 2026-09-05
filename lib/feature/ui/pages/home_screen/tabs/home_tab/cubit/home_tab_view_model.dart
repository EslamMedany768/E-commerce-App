import 'package:e_commerce_app/domain/entities/CategoryOrBrandEntity.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_brands.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'home_tab_states.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;
   List<CategoryOrBrandEntity>? brandList;
   List<CategoryOrBrandEntity>? categoryList;

  HomeTabViewModel({
    required this.getAllCategoriesUseCase,
    required this.getAllBrandsUseCase,
  }) : super(HomeTabInitialState());

  /// hold data & handle logic
  List<String> announcementImages = [
    "assets/images/announcement_1.png",
    "assets/images/announcement_2.png",
    "assets/images/announcement_3.png",
  ];

  getAllCategories() async {
    emit(CategoryLoadingState());
    var either = await getAllCategoriesUseCase.invoke();
    either.fold(
      (error) {
        return emit(CategoryErrorState(error: error.errorName));
      },
      (response) {
        categoryList=response.data;
        return emit(CategorySuccessState());
      },
    );
  }

  getAllBrands() async {
    emit(BrandLoadingState());
    var either = await getAllBrandsUseCase.invoke();
    either.fold(
      (error) {
        return emit(BrandErrorState(error: error.errorName));
      },
      (response) {
        brandList = response.data;
        return emit(CategorySuccessState());
      },
    );
  }
}
