import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controllers/cart_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimenions.dart';
import '../../widgets/app_column.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text_widget.dart';
import '../cart/cart_page.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;

  PopularFoodDetail({Key? key, required this.pageId, required this.page}) : super(key: key);

  Future<bool> _onWillPop() async {
    return (await Get.toNamed(RouteHelper.getInitial())) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>()); // resets product data within the Ui in the case of us opening another product


    //print("page id is " + pageId.toString());
    //print("product name is " + product.name.toString());

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(  // scaffold offers a different color compared to container, which is better
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // background image
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!,
                    )
                  )
                )
              )
            ),
            // icon widgets
            Positioned(
                top: Dimensions.height45,
                left: Dimensions.width20,
                right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        if(page=="cartpage"){
                          Get.toNamed(RouteHelper.getCartPage());
                        } else {
                          Get.toNamed(RouteHelper.getInitial());
                        }
                      },
                      child: AppIcon(icon: Icons.arrow_back_ios,)),
                  GetBuilder<PopularProductController>(builder: (controller){
                    return GestureDetector(
                          onTap: (){
                            if(controller.totalItems>=1)
                              Get.toNamed(RouteHelper.getCartPage());
                          },
                          child: Stack(
                        children: [
                          AppIcon(icon: Icons.shopping_cart_outlined,),
                          controller.totalItems>=1? Positioned(right: 0, top: 0, child: AppIcon(icon: Icons.circle, size:20, iconColor: Colors.transparent, backgroundColor: AppColors.mainColor)) : Container(),
                          controller.totalItems>=1? Positioned(right: 3, top: 3, child: BigText(text: controller.totalItems.toString(), size: 12, color: Colors.white)) : Container(),
                        ]
                      ),
                    );
                  }),
                ],
              ),
            ),
            // introduction of food
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize-20,
              child: Container(
                  padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20),
                        topRight: Radius.circular(Dimensions.radius20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(text: product.name!),
                      SizedBox(height: Dimensions.height20,),
                      BigText(text: "Introduce"),
                      // expandable text widget
                      SizedBox(height: Dimensions.height20,),
                      Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text: product.description!))),


                    ]
                  ),
              ),
            ),

          ]
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct){
          return Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30, left: Dimensions.width20, right: Dimensions.width20),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20*2),
                topRight: Radius.circular(Dimensions.radius20*2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(false);
                          },
                          child: Icon(Icons.remove, color: AppColors.signColor, )),
                      SizedBox(width: Dimensions.width10/2,),
                      BigText(text: popularProduct.inCartItems.toString(),),
                      SizedBox(width: Dimensions.width10/2,),
                      GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(true);
                          },
                          child: Icon(Icons.add, color: AppColors.signColor, )),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    popularProduct.addItem(product);
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
                    child: BigText(text: "\$ ${product.price!} | Add to cart", color: Colors.white,), // if ur variable is part of an object, then u'll need to add curly braces too like so: ${product.price!}
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
