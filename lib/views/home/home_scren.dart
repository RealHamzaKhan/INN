import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inn/views/common_widgets/custom_button.dart';
import 'package:inn/views/common_widgets/custom_text.dart';
import 'package:inn/views/common_widgets/spacers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 6.h),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset('assets/images/logo.png',width: 233.w,height: 126.h,fit: BoxFit.cover,)),
              heightSpacer(height: 45.h),
              Image.asset('assets/images/mosque.png',width: double.infinity,height: 264.h,fit: BoxFit.fill,),
              heightSpacer(height: 32.h),
              customText(text:'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ ٱللَّهِ وَبَرَكاتُهُ‎' ,fw: FontWeight.w600,size: 20.sp),
              heightSpacer(height: 120.h),
              Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: customButton(title: 'Apply as Mufti',color: const Color.fromRGBO(119, 214, 61, 1),
                  containerWidth: 180.w
                      ,containerHeight:50.h ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
