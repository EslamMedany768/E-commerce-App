import 'package:e_commerce_app/Core/utils/app_colors.dart';
import 'package:e_commerce_app/Core/utils/app_styles.dart';
import 'package:e_commerce_app/Core/utils/dialogUtils.dart';
import 'package:e_commerce_app/Core/utils/flutter_toast.dart';
import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerce_app/feature/ui/pages/cart_screen/cubit/cart_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ui/pages/cart_screen/cubit/cart_view_model.dart';

class CartItem extends StatelessWidget {
  GetProductsResponseEntity item;

  CartItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<CartViewModel>(context);
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.greyBlue, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        children: [
          Container(
            height: size.height * 0.13,
            width: size.width * 0.29,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Image.network(
              item.product!.imageCover!,
              height: double.infinity,
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: SizedBox(
              height: size.height * 0.1,
              width: size.width * 0.58,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          item.product!.title!,
                          style: AppStyle.medium18darkBlue,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          viewModel.deleteCartItem(item.product!.id!);
                        },
                        child: ImageIcon(
                          AssetImage("assets/images/trash_icon.png"),
                          color: AppColor.darkBlue,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "EGP ${item.price!.toDouble().toString()}",
                        style: AppStyle.medium18darkBlue,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColor.primary,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.03,
                            vertical: size.height * 0.006,
                          ),
                          child: BlocBuilder<CartViewModel, CartStates>(
                            builder: (context, state) {
                              return Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      viewModel.updateCartItem(
                                        item.product!.id!,
                                        (item.count!.toInt() - 1),
                                      );
                                    },
                                    child: ImageIcon(
                                      color: AppColor.white,
                                      AssetImage(
                                        "assets/images/minus_icon.png",
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: size.width * 0.04),
                                  state is CartUpdateSuccessStates
                                      ? Text(
                                          item.count.toString(),
                                          style: AppStyle.medium18white,
                                        )
                                      : Text(
                                          item.count.toString(),
                                          style: AppStyle.medium18white,
                                        ),

                                  SizedBox(width: size.width * 0.04),
                                  InkWell(
                                    onTap: () {
                                      viewModel.updateCartItem(
                                        item.product!.id!,
                                        (item.count!.toInt() + 1),
                                      );
                                    },
                                    child: ImageIcon(
                                      color: AppColor.white,
                                      AssetImage("assets/images/plus_icon.png"),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
