import 'package:flutter/cupertino.dart';

import '../utils/dimenions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final double iconSize;
  AppIcon({Key? key,
    this.iconSize = 16,
    required this.icon,
    this.backgroundColor = const Color(0xFFFCF4E4),
    this.iconColor = const Color(0xFF756D54),
    this.size = 40
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroundColor
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      )
    );
  }
}
