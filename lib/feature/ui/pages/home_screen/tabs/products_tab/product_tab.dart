import 'package:e_commerce_app/Core/utils/app_colors.dart';
import 'package:e_commerce_app/di/di.dart';
import 'package:e_commerce_app/feature/ui/pages/home_screen/tabs/products_tab/cubit/product_tab_states.dart';
import 'package:e_commerce_app/feature/ui/pages/home_screen/tabs/products_tab/cubit/product_tab_view_model.dart';
import 'package:e_commerce_app/feature/ui/pages/product_details_screen/product_details_screen.dart';
import 'package:e_commerce_app/feature/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../Core/utils/app_styles.dart';
import '../../../../../../Core/utils/flutter_toast.dart';
import '../../../../../widgets/product_tab_item.dart';

class ProductTab extends StatelessWidget {
  static const String routeName = "product_tab";
  ProductTabViewModel viewModel = getIt<ProductTabViewModel>();

  ProductTab({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: BlocListener<ProductTabViewModel, ProductTabStates>(
          listener: (context, state) {
            if (state is AddToCartSuccessStates) {
              print("succ");
              FlutterToast.showToast(
                text:
                    "Added Successfully",
              );
            } else if (state is AddToCartErrorStates) {
              print("error");
              FlutterToast.showToast(text: state.errorName);
            } else if (state is AddToWishlistSuccessState) {
              return FlutterToast.showToast(text: "Added Successfully");
            } else {
              return FlutterToast.showToast(text: "Failed");
            }
          },
          child: BlocBuilder<ProductTabViewModel, ProductTabStates>(
            bloc: viewModel..getAllProducts(),
            builder: (context, state) {
              if (state is ProductTabErrorStates) {
                return Column(
                  children: [
                    Text(state.errorName, style: AppStyle.medium18darkBlue),
                  ],
                );
              } else if (state is ProductTabSuccessStates) {
                return Column(
                  children: [
                    // CustomAppbar(),
                    Expanded(
                      child: GridView.builder(
                        itemCount: state.productsList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: size.width * 0.02,
                          crossAxisSpacing: size.width * 0.01,
                          childAspectRatio: 2 / 2.7,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                ProductDetailsScreen.routeName,
                                arguments: state.productsList[index],
                              );
                            },
                            child: ProductTabItem(
                              product: state.productsList[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else if (state is ProductTabLoadingStates) {
                return Center(
                  child: CircularProgressIndicator(color: AppColor.primary),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
