import 'package:e_commerce_app/Core/utils/app_colors.dart';
import 'package:e_commerce_app/Core/utils/app_styles.dart';
import 'package:e_commerce_app/di/di.dart';
import 'package:e_commerce_app/feature/ui/pages/cart_screen/cubit/cart_states.dart';
import 'package:e_commerce_app/feature/ui/pages/cart_screen/cubit/cart_view_model.dart';
import 'package:e_commerce_app/feature/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/utils/flutter_toast.dart';
import '../../../widgets/custom_button.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = "cart_screen";

  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<CartViewModel>(context).getCartItem();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.primary),
        centerTitle: true,
        title: Text("Cart", style: AppStyle.medium20darkBlue),
        actions: [
          IconButton(
            onPressed: () {},
            icon: ImageIcon(AssetImage("assets/images/search_icon.png")),
          ),
          IconButton(
            onPressed: () {},
            icon: ImageIcon(AssetImage("assets/images/cart_icon.png")),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: BlocListener<CartViewModel, CartStates>(
          listener: (context, state) {
            if (state is CartDeleteSuccessStates) {
              FlutterToast.showToast(text: "fsf");
            }
          },
          child: BlocBuilder<CartViewModel, CartStates>(
            builder: (BuildContext context, state) {
              if (state is CartErrorStates) {
                return Column(children: [Text(state.error)]);
              } else if (state is CartSuccessStates) {
                return state.cartItems.data!.products!.isEmpty
                    ? Center(
                        child: Text(
                          "No item added",
                          style: AppStyle.medium18darkBlue,
                        ),
                      )
                    : Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(height: size.height * (0.02));
                              },
                              itemCount: state.cartItems.data!.products!.length,
                              itemBuilder: (context, index) {
                                return CartItem(
                                  item: state.cartItems.data!.products![index],
                                );
                              },
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Total price",
                                    style: AppStyle.medium18darkBlue.copyWith(
                                      color: Color(0x9906004f),
                                    ),
                                  ),
                                  Text(
                                    "EGP ${state.cartItems.data!.totalCartPrice}",
                                    style: AppStyle.medium18darkBlue,
                                  ),
                                ],
                              ),
                              CustomButton(
                                suffixIcon: Icons.arrow_forward,
                                text: "Check Out",
                              ),
                            ],
                          ),
                        ],
                      );
              } else if (state is CartDeleteSuccessStates) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(height: size.height * (0.02));
                        },
                        itemCount: state.cartItems.data!.products!.length,
                        itemBuilder: (context, index) {
                          return CartItem(
                            item: state.cartItems.data!.products![index],
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Total price",
                              style: AppStyle.medium18darkBlue.copyWith(
                                color: Color(0x9906004f),
                              ),
                            ),
                            Text(
                              "EGP ${state.cartItems.data!.totalCartPrice}",
                              style: AppStyle.medium18darkBlue,
                            ),
                          ],
                        ),
                        CustomButton(
                          suffixIcon: Icons.arrow_forward,
                          text: "Check Out",
                        ),
                      ],
                    ),
                  ],
                );
              } else if (state is CartUpdateSuccessStates) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(height: size.height * (0.02));
                        },
                        itemCount: state.cartItems.data!.products!.length,
                        itemBuilder: (context, index) {
                          return CartItem(
                            item: state.cartItems.data!.products![index],
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Total price",
                              style: AppStyle.medium18darkBlue.copyWith(
                                color: Color(0x9906004f),
                              ),
                            ),
                            Text(
                              "EGP ${state.cartItems.data!.totalCartPrice}",
                              style: AppStyle.medium18darkBlue,
                            ),
                          ],
                        ),
                        CustomButton(
                          suffixIcon: Icons.arrow_forward,
                          text: "Check Out",
                        ),
                      ],
                    ),
                  ],
                );
              } else if (state is CartDeleteErrorStates) {
                return Column(children: [Text(state.error)]);
              } else {
                return Center(
                  child: CircularProgressIndicator(color: AppColor.primary),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
