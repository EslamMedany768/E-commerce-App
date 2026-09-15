import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/Core/utils/app_colors.dart';
import 'package:e_commerce_app/Core/utils/app_styles.dart';
import 'package:e_commerce_app/domain/entities/ProductResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_carousel_slider/flutter_image_slider.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cart_screen/cubit/cart_view_model.dart';
import '../home_screen/tabs/products_tab/cubit/product_tab_view_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = "product_details_screen";

  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<ProductTabViewModel>(context);
    var args = ModalRoute.of(context)!.settings.arguments as ProductEntity;
    var size = MediaQuery.of(context).size;
    print(args.description);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.primary),
        centerTitle: true,
        title: Text("Product Details", style: AppStyle.medium20darkBlue),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_rounded, size: 30),
          ),
          IconButton(
            onPressed: () {},
            icon: ImageIcon(AssetImage("assets/images/cart_icon.png")),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.greyBlue, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(26)),
                      child: ImageSlideshow(
                        height: size.height * 0.321,
                        indicatorBackgroundColor: AppColor.white,
                        indicatorBottomPadding: 17,
                        indicatorColor: AppColor.primary,
                        initialPage: 0,
                        isLoop: true,
                        indicatorRadius: 5,
                        children: args.images!.map((url) {
                          return CachedNetworkImage(
                            imageUrl: url,
                            fit: BoxFit.contain,
                            width: double.infinity,
                            height: double.infinity,
                            errorWidget: (context, url, error) {
                              return Icon(Icons.error);
                            },
                            placeholder: (context, url) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: AppColor.primary,
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 19,
                    right: 19,
                    child: InkWell(
                      onTap: () {
                        BlocProvider.of<ProductTabViewModel>(
                          context,
                        ).addToWishlist(args.id!);
                      },
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: AppColor.white,
                        child: ImageIcon(
                          color: AppColor.primary,
                          AssetImage("assets/images/fav_icon_selected.png"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      args.title.toString(),
                      style: AppStyle.medium18darkBlue,
                    ),
                  ),
                  Text("EGP ${args.price}", style: AppStyle.medium18darkBlue),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: AppColor.primary, width: .5),
                    ),
                    child: Text(
                      "${args.sold.toString()} Sold",
                      style: AppStyle.regular14darkBlue,
                    ),
                  ),
                  SizedBox(width: 30.w),
                  Icon(Icons.star, color: Colors.yellow),
                  SizedBox(width: 2.w),
                  Text(
                    "${args.ratingsAverage} (${args.ratingsQuantity})",
                    style: AppStyle.regular14darkBlue,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Text("Description", style: AppStyle.medium18darkBlue),
              SizedBox(height: 5.h),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "${args.description}",
                      style: AppStyle.regular14darkBlue,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [

                  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Total Price",style: AppStyle.light14grey.copyWith(fontWeight: FontWeight.bold),),
                      Text("EGP ${(args.price)}",style: AppStyle.medium18darkBlue,),
                    ],
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(12),
                        backgroundColor: AppColor.primary,
                      ),
                      onPressed: () {
                        viewModel.addToCart(args.id!);
                      },
                      child: Text("Add to Cart", style: AppStyle.medium18white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }
}
