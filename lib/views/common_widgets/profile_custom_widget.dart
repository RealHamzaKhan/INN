import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inn/views/common_widgets/spacers.dart';

import 'custom_text.dart';

Padding profileCustomWidget({required String text,required IconData iconData,required Function() onTap }) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.w),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.r)),
        child: Row(
          children: [
            widthSpacer(width: 21.w),
            Container(
              width: 60.w,
              alignment: Alignment.center,
              height: 60.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: const Color.fromRGBO(119, 214, 61, 1)),
              child: Icon(
                iconData,
                color: Colors.white,
                size: 39.w,
              ),
            ),
            widthSpacer(width: 18.w),
            customText(text: text, size: 20.sp, fw: FontWeight.w600)
          ],
        ),
      ),
    ),
  );
}
