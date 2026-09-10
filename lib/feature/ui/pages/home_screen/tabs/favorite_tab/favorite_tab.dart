import 'package:e_commerce_app/Core/utils/app_colors.dart';
import 'package:e_commerce_app/Core/utils/flutter_toast.dart';
import 'package:e_commerce_app/feature/ui/pages/home_screen/tabs/favorite_tab/favorite_card_widget.dart';
import 'package:e_commerce_app/feature/ui/pages/home_screen/tabs/products_tab/cubit/product_tab_states.dart';
import 'package:e_commerce_app/feature/ui/pages/home_screen/tabs/products_tab/cubit/product_tab_view_model.dart';
import 'package:e_commerce_app/feature/widgets/product_tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteTab extends StatelessWidget {
  static const String routeName = "favorite_tab";

  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel=BlocProvider.of<ProductTabViewModel>(context);
    return Scaffold(
      body: BlocListener<ProductTabViewModel,ProductTabStates>(
        bloc: viewModel,
        listener: (context, state) {
          if(state is DeleteFromWishlistSuccessState){
            viewModel.getWishListItems();
          }else if(state is AddToCartSuccessStates){
            FlutterToast.showToast(text: "AddedSuccessfully");
            viewModel.getWishListItems();
          }else if(state is AddToWishlistErrorState){
            FlutterToast.showToast(text: "Please try again");
            viewModel.getWishListItems();
          }
        },
        child: BlocBuilder<ProductTabViewModel, ProductTabStates>(
          bloc: viewModel..getWishListItems(),
          builder: (context, state) {
            if (state is GetWishlistItemsSuccessState) {
              return ListView.builder(
                itemCount: state.response.data!.length,
                itemBuilder: (context, index) {
                  return FavoriteCardWidget(
                    product: state.response.data![index],
                    primaryBlue: AppColor.primary,
                  );
                },
              );
            } else if (state is GetWishlistItemsErrorState) {
              return Text(state.errorName);
            } else if (state is DeleteFromWishlistErrorState) {
              return Text(state.errorName);
            }

            else {
              return Center(child: CircularProgressIndicator(color: Colors.blue));
            }
          },
        ),
      ),
    );
  }
}
