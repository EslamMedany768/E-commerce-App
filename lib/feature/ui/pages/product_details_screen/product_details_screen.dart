import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/Core/utils/app_colors.dart';
import 'package:e_commerce_app/Core/utils/app_styles.dart';
import 'package:e_commerce_app/domain/entities/ProductResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_carousel_slider/flutter_image_slider.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = "product_details_screen";

  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as ProductEntity;
    var size = MediaQuery.of(context).size;

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
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: AppColor.white,
                      child: ImageIcon(
                        color: AppColor.primary,
                        AssetImage("assets/images/fav_icon_selected.png"),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(args.title.toString(), style: AppStyle.medium18darkBlue),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
