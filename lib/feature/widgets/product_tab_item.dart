import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/Core/utils/app_colors.dart';
import 'package:e_commerce_app/Core/utils/app_styles.dart';
import 'package:e_commerce_app/Core/utils/flutter_toast.dart';
import 'package:e_commerce_app/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerce_app/feature/ui/pages/home_screen/tabs/products_tab/cubit/product_tab_states.dart';
import 'package:e_commerce_app/feature/ui/pages/home_screen/tabs/products_tab/cubit/product_tab_view_model.dart';
import 'package:e_commerce_app/feature/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_carousel_slider/flutter_image_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTabItem extends StatelessWidget {
  ProductEntity product;

  ProductTabItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<ProductTabViewModel>(context);
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.greyBlue, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                imageUrl: product.imageCover!,
                placeholder: (context, url) {
                  return Center(
                    child: CircularProgressIndicator(color: AppColor.primary),
                  );
                },
                errorWidget: (context, url, error) {
                  return Icon(Icons.error);
                },
                fit: BoxFit.contain,
                height: 140.h,
                width: 191.w,
              ),

              Positioned(
                right: 6,
                top: 6,
                child:  InkWell(
                    onTap: () {
                      viewModel.addToWishlist(product.id!);
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColor.white,
                      foregroundColor: AppColor.primary,
                      radius: 14,
                      child: ImageIcon(
                        AssetImage("assets/images/fav_icon_selected.png"),
                      ),
                    ),
                  ),

              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                CustomText(
                  text: product.title.toString(),
                  style: AppStyle.regular14darkBlue,
                ),
                CustomText(
                  text: product.description.toString(),
                  style: AppStyle.regular14darkBlue,
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        "EGP ${product.price} ",
                        style: AppStyle.regular14darkBlue,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: AutoSizeText(
                        maxLines: 1,

                        overflow: TextOverflow.ellipsis,
                        "${(product.price! * 2)} EGP",
                        style: AppStyle.regular14darkBlue.copyWith(
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.01),
                Row(
                  children: [
                    Text("Review", style: AppStyle.regular14darkBlue),
                    Text(
                      " (${product.ratingsAverage})",
                      style: AppStyle.regular14darkBlue,
                    ),
                    Icon(Icons.star, color: Colors.yellow),
                    Spacer(),

                    InkWell(
                      onTap: () {
                        ///todo: addToCart
                        viewModel.addToCart(product.id!);
                      },
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: AppColor.primary,
                        child: Icon(
                          Icons.add_rounded,
                          color: AppColor.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
