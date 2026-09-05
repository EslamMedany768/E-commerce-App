import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/Core/utils/app_colors.dart';
import 'package:e_commerce_app/Core/utils/app_styles.dart';
import 'package:e_commerce_app/domain/entities/CategoryOrBrandEntity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  CategoryOrBrandEntity category;

  CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(60)),
          child: CachedNetworkImage(
            height: size.height * 0.107,
            width: size.width * 0.232,
            imageUrl: category.image??"",
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => Icon(Icons.error),
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(color: AppColor.primary),
            ),
          ),
        ),
        SizedBox(height: 8),

        Text(
          category.name??"",
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: AppStyle.regular14darkBlue,
        ),
      ],
    );
  }
}
