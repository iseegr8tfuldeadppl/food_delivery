import 'package:flutter/cupertino.dart';

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

  double textHeight = Dimensions.screenHeight/5.63;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
