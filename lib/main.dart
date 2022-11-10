import 'package:flutter/material.dart';
import 'package:food_delivery/pages/cart/cart_page.dart';
import 'package:food_delivery/pages/food/popular_food_detail.dart';
import 'package:food_delivery/pages/food/recommended_food_detail.dart';
import 'package:food_delivery/pages/splash/splash_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'controllers/cart_controller.dart';
import 'controllers/popular_product_controller.dart';
import 'controllers/recommended_product_controller.dart';
import 'pages/home/main_food_page.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  // always try to load your dependencies before the app starts to run
  WidgetsFlutterBinding.ensureInitialized(); // this will ensure the line below this finished initializing before the Ui begins
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_){ // having called this function we were able to save the two variables we loaded from the server (in splash_screen.dart)
      return GetBuilder<RecommendedProductController>(builder: (_){ // having called this function we were able to save the two variables we loaded from the server (in splash_screen.dart)
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          //home: MainFoodPage(),
          //home: SplashScreen(),
          initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,
        );
      });
    });
  }
}
