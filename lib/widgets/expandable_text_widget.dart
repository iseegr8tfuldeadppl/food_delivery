import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimenions.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf; // because we are going to intiialize them later and not now, otherwise u'll be forced to init them

  bool hiddenText = true;

  // the weirest method i've ever seen but somehow the proportions work, idk about tablets tho
  double textHeight = Dimensions.screenHeight/5.63;

  @override
  void initState(){
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = ""; // it has to be initialized before it is used
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty? SmallText(text: firstHalf, size: Dimensions.font16, color: AppColors.paraColor, height: 1.8, ) : Column(
        children: [
          SmallText(text: hiddenText? (firstHalf+"...") : (firstHalf+secondHalf), size: Dimensions.font16, color: AppColors.paraColor, height: 1.8, ),
          InkWell(
            onTap: () {
              setState((){
                hiddenText = !hiddenText;
              });
            },
            child: Row(
              children: [
                SmallText(text: hiddenText? "Show more": "Show less", color: AppColors.mainColor),
                Icon(hiddenText? Icons.arrow_drop_down : Icons.arrow_drop_up, color: AppColors.mainColor,),
              ],
            )
          )
        ],
      ),
    );
  }
}
