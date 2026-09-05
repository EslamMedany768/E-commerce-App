import 'package:e_commerce_app/Core/utils/app_colors.dart';
import 'package:e_commerce_app/Core/utils/app_styles.dart';
import 'package:e_commerce_app/feature/ui/pages/cart_screen/cart_screen.dart';
import 'package:e_commerce_app/feature/ui/pages/home_screen/tabs/products_tab/cubit/product_tab_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ui/pages/home_screen/tabs/products_tab/cubit/product_tab_view_model.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel=BlocProvider.of<ProductTabViewModel>(context);
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset("assets/images/route_icon_leading.png"),
        SizedBox(height: size.height * 0.019),
        Row(
          children: [
            Expanded(
              child: TextField(
                style: AppStyle.light14grey.copyWith(
                  color: AppColor.primary,
                  decorationThickness: 0,
                ),
                cursorColor: AppColor.primary,
                decoration: InputDecoration(
                  hintText: "what do you search for?",
                  hintStyle: AppStyle.light14grey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide: BorderSide(color: AppColor.primary, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide: BorderSide(color: AppColor.primary, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide: BorderSide(color: AppColor.primary, width: 1),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide: BorderSide(color: AppColor.primary, width: 1),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide: BorderSide(color: AppColor.primary, width: 1),
                  ),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: AppColor.primary,
                  ),
                ),
              ),
            ),
            SizedBox(width: size.width * 0.06),
            BlocBuilder<ProductTabViewModel, ProductTabStates>(
              bloc: viewModel,
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                  child: Badge(
                    alignment: Alignment.topLeft,
                    backgroundColor: Colors.green,
                    label: state is AddToCartSuccessStates
                        ? Text(
                      viewModel.numOfItemsInCart.toString(),
                          )
                        : Text(
                      viewModel.numOfItemsInCart.toString(),
                          ),
                    child: ImageIcon(
                      AssetImage("assets/images/cart_icon.png"),
                      color: AppColor.primary,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        SizedBox(height: size.height * 0.017),
      ],
    );
  }
}
