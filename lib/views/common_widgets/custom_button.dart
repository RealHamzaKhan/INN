import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

GestureDetector customButton({final double? containerHeight,
final double? containerWidth,
  final String? title,
  final Color? color,
  final Function()? onPress,

}){
  return GestureDetector(
    onTap: onPress,
    child: Container(
      height: containerHeight,
      width: containerWidth,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(150)
      ),
      child: customText(
          text: title,
          color: Colors.black,
          size: 14.sp,
          fw: FontWeight.w600
      ),
    ),
  );
}