import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/dimenions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                color: Colors.white,
                child: Center(child: BigText(text: "Chinese Side", size: Dimensions.font26),),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10,)
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                    "assets/image/food0.png",
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
            ),
          ),
          SliverToBoxAdapter(
            child: Text("Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, Hey what's up guys it's scarce here, "),
          ),
        ],
      )
    );
  }
}
