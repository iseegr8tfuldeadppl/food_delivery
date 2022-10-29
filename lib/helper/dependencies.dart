import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controllers/cart_controller.dart';
import '../controllers/popular_product_controller.dart';
import '../controllers/recommended_product_controller.dart';
import '../data/api/api_client.dart';
import '../data/repository/cart_repo.dart';
import '../data/repository/popular_product_repo.dart';
import '../data/repository/recommended_product_repo.dart';
import '../utils/app_constants.dart';

Future<void> init() async {

  // generally u first load the api client
  Get.lazyPut(()=> ApiClient(appBaseUrl:AppConstants.BASE_URL));

  // after that u load the repositories
  Get.lazyPut(()=> PopularProductRepo(apiClient:Get.find())); // apiClient has to be the same name as the one you mentioned inside repo dart file
  Get.lazyPut(()=> RecommendedProductRepo(apiClient:Get.find())); // apiClient has to be the same name as the one you mentioned inside repo dart file
  Get.lazyPut(()=> CartRepo());

  // then you load your controllers
  Get.lazyPut(()=> PopularProductController(popularProductRepo:Get.find()));
  Get.lazyPut(()=> RecommendedProductController(recommendedProductRepo:Get.find()));
  Get.lazyPut(() => CartController(cartRepo:Get.find()));


}