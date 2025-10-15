import 'package:flutter/material.dart';
import 'package:nexus_one/core/constants/app_colors.dart';

class CustomIconButton{
  static Widget buildCustomIconButton({
    void Function()? function,
    String? imageUrl,
    Color? color,
}){
    return InkWell(
        splashColor: AppColors.TRANSPARENT_COLOR,
        onTap: function,
        child: Image.asset(imageUrl!,color: color));
  }
}