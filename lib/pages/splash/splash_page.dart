import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/dimenions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResources() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadResources();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))..forward(); // requires u to add " with TickerProviderStateMixin" to the class _SplashScreenState extends.. line
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    Timer(
      Duration(seconds: 3),
        ()=>Get.offNamed(RouteHelper.getInitial()),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold( // scaffold offers a different color compared to container, which is better
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(scale: animation, child: Center(child: Image.asset("assets/image/logo part 1.png", width: Dimensions.splashImg))),
          Center(child: Image.asset("assets/image/logo part 2.png", width: Dimensions.splashImg)),
        ],
      ),
    );
  }
}
