import 'package:e_commerce_app/Core/utils/app_colors.dart';
import 'package:e_commerce_app/Core/utils/app_styles.dart';
import 'package:e_commerce_app/di/di.dart';
import 'package:e_commerce_app/domain/entities/CategoryOrBrandEntity.dart';
import 'package:e_commerce_app/feature/widgets/category_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';

import '../../../../../widgets/custom_appbar.dart';
import 'cubit/home_tab_states.dart';
import 'cubit/home_tab_view_model.dart';

@injectable
class HomeTab extends StatefulWidget {
  static const String routeName = "home_tab";

  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeTabViewModel viewModel = getIt<HomeTabViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    viewModel.getAllBrands();
    viewModel.getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageSlideshow(
              autoPlayInterval: 4000,
              isLoop: true,
              initialPage: 0,
              indicatorBackgroundColor: AppColor.white,
              indicatorColor: AppColor.primary,
              indicatorPadding: 8,
              indicatorBottomPadding: 20,
              indicatorRadius: 5,
              children: viewModel.announcementImages.map((path) {
                return Image.asset(path);
              }).toList(),
            ),
            titleRow(name: "Categories", secondText: "view all"),
            SizedBox(height: size.height * 0.017),
            BlocBuilder<HomeTabViewModel, HomeTabStates>(
              bloc: viewModel,
              builder: (context, state) {
                if (state is CategoryLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(color: AppColor.primary),
                  );
                } else if (state is CategoryErrorState) {
                  return Text(state.error, style: AppStyle.medium18darkBlue);
                } else if (state is CategorySuccessState) {
                  return customGridView(list: viewModel.categoryList ?? []);
                } else {
                  return Container(color: Colors.red, child: Text("sfsf"));
                }
              },
            ),
            titleRow(name: "Brands", secondText: "view all"),
            BlocBuilder<HomeTabViewModel, HomeTabStates>(
              bloc: viewModel,
              builder: (context, state) {
                if (state is BrandErrorState) {
                  return Text(state.error);
                } else if (state is CategorySuccessState) {
                  return customGridView(list: viewModel.brandList ?? []);
                } else {
                  return Center(
                    child: CircularProgressIndicator(color: AppColor.primary),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget titleRow({required name, String? secondText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: AppStyle.medium18darkBlue),
        TextButton(
          style: TextButton.styleFrom(overlayColor: Colors.transparent),
          onPressed: () {},
          child: Text(secondText ?? "", style: AppStyle.regular12darkBlue),
        ),
      ],
    );
  }

  Widget customGridView({required List<CategoryOrBrandEntity> list}) {
    return SizedBox(
      height: 340.h,
      width: double.infinity,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.4,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: CategoryCard(category: list[index]),
          );
        },
      ),
    );
  }
}
