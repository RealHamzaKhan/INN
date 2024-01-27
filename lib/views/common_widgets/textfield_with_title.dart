import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inn/views/common_widgets/custom_text.dart';
import 'package:inn/views/common_widgets/spacers.dart';

Column textFieldWithTitle({final String? title,final String? hintText,final TextEditingController? controller,
  bool isPass=false,final int? minLines,final int? maxLines,final TextInputType? keyboardtype,
}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      customText(text: title,color: Colors.black,fw:FontWeight.w500 ,size: 14.sp),
      heightSpacer(height: 5.h),
      TextFormField(
        keyboardType: keyboardtype,
        controller: controller,
        minLines: minLines,
        maxLines: maxLines,
        obscureText: isPass,
        decoration:isPass? InputDecoration(
          suffixIcon: const Icon(Icons.visibility),
            hintText: hintText,
            contentPadding:  EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(217, 217, 217, 1)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(217, 217, 217, 0.34)),
            ),
            filled: true,
            fillColor: const Color.fromRGBO(217, 217, 217, 0.34)
        ):InputDecoration(
            hintText: hintText,
            contentPadding:  EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(217, 217, 217, 1)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(217, 217, 217, 0.34)),
            ),
            filled: true,
            fillColor: const Color.fromRGBO(217, 217, 217, 0.34)
        ),
      )
    ],
  );
}