import 'package:e_commerce_app/Core/cache/shared_preference_utils.dart';
import 'package:e_commerce_app/feature/ui/auth/login/loginScreen.dart';
import 'package:e_commerce_app/feature/ui/auth/register/registerScreen.dart';
import 'package:e_commerce_app/feature/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_view_model.dart';
import 'package:e_commerce_app/feature/ui/pages/home_screen/tabs/products_tab/cubit/product_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'di/di.dart';
import 'feature/ui/pages/cart_screen/cart_screen.dart';
import 'feature/ui/pages/cart_screen/cubit/cart_view_model.dart';
import 'feature/ui/pages/home_screen/home_screen.dart';
import 'feature/ui/pages/home_screen/tabs/home_tab/home_tab.dart';
import 'feature/ui/pages/product_details_screen/product_details_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceUtils.init();

  String? route;
  var token = SharedPreferenceUtils.getData(key: "token");
  if (token == null) {
    route = LoginScreen.routeName;
  } else {
    route = HomeScreen.routeName;
  }

  configureDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ProductTabViewModel>()),
        BlocProvider(create: (context) => getIt<CartViewModel>(),)
      ],
      child: MyApp(route: route),
    ),
  );
}

class MyApp extends StatelessWidget {
  String? route;

  MyApp({required this.route});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      builder: (context, child) => MaterialApp(
        initialRoute: route,
        routes: {
          CartScreen.routeName:(context)=>CartScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          ProductDetailsScreen.routeName: (context) => ProductDetailsScreen(),
          RegisterScreen.routeName: (context) => RegisterScreen(),
          HomeTab.routeName: (context) => HomeTab(),
          LoginScreen.routeName: (context) => LoginScreen(),
        },
      ),
    );
  }
}
