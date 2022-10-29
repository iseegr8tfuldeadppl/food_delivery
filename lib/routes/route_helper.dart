import 'package:food_delivery/pages/food/popular_food_detail.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';import '../controllers/cart_controller.dart';


import '../pages/food/recommended_food_detail.dart';
import '../pages/home/main_food_page.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";

  static String getInitial()=>'$initial';
  static String getPopularFood(int pageId)=> '$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId)=> '$recommendedFood?pageId=$pageId';

  // GetMaterialApp in main.dart takes a list of pages, so let's create a list of all our pages
  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPage()),
    GetPage(name: popularFood, page: (){
      var pageId = Get.parameters['pageId'];
      return PopularFoodDetail(pageId: int.parse(pageId!));
    },
        transition: Transition.fadeIn),

    GetPage(name: recommendedFood, page: (){
      var pageId = Get.parameters['pageId'];
      return RecommendedFoodDetail(pageId: int.parse(pageId!));
    },
        transition: Transition.fadeIn),
  ];
}