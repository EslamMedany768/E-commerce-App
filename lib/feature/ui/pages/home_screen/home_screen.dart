import 'package:e_commerce_app/Core/cache/shared_preference_utils.dart';
import 'package:e_commerce_app/Core/utils/app_colors.dart';

import 'package:e_commerce_app/feature/ui/pages/home_screen/tabs/favorite_tab/favorite_tab.dart';
import 'package:e_commerce_app/feature/ui/pages/home_screen/tabs/home_tab/home_tab.dart';
import 'package:e_commerce_app/feature/ui/pages/home_screen/tabs/products_tab/cubit/product_tab_view_model.dart';
import 'package:e_commerce_app/feature/ui/pages/home_screen/tabs/products_tab/product_tab.dart';
import 'package:e_commerce_app/feature/ui/pages/home_screen/tabs/user_tab/user_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screenList = [HomeTab(), ProductTab(), FavoriteTab(), UserTab()];
  int index = 0;
  @override

  @override
  Widget build(BuildContext context) {
    print(SharedPreferenceUtils.getData(key: "token"));
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: index == 0 || index == 1
          ? AppBar(
              title: CustomAppbar(),
              toolbarHeight: size.height * 0.14,
              backgroundColor: AppColor.white,
            )
          : null,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: screenList[index],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.primary,
        elevation: 0,
        currentIndex: index,
        selectedItemColor: AppColor.primary,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 40,
        onTap: (value) {
          index = value;
          setState(() {});
        },
        items: [
          customBottomNavBarItem(
            indexOfItem: 0,
            selectedIconPath: "assets/images/home_icon_selected.png",
            unSelectedIconPath: "assets/images/home_icon_unselected.png",
          ),
          customBottomNavBarItem(
            indexOfItem: 1,
            selectedIconPath: "assets/images/products_icon_selected.png",
            unSelectedIconPath: "assets/images/products_icon_unselected.png",
          ),
          customBottomNavBarItem(
            indexOfItem: 2,
            selectedIconPath: "assets/images/fav_icon_selected.png",
            unSelectedIconPath: "assets/images/fav_icon_unselected.png",
          ),
          customBottomNavBarItem(
            indexOfItem: 3,
            selectedIconPath: "assets/images/profile_icon_selected.png",
            unSelectedIconPath: "assets/images/profile_icon_unselected.png",
          ),
        ],
      ),
    );
  }

  customBottomNavBarItem({
    required String selectedIconPath,
    required String unSelectedIconPath,
    required int indexOfItem,
  }) {
    return BottomNavigationBarItem(
      label: "",
      icon: index == indexOfItem
          ? CircleAvatar(
              backgroundColor: AppColor.white,
              foregroundColor: AppColor.primary,
              child: ImageIcon(AssetImage(selectedIconPath)),
            )
          : ImageIcon(color: AppColor.white, AssetImage(unSelectedIconPath)),
    );
  }
}
