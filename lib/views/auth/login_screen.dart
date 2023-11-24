import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inn/views/common_widgets/custom_button.dart';
import 'package:inn/views/common_widgets/custom_text.dart';
import 'package:inn/views/common_widgets/spacers.dart';
import 'package:inn/views/common_widgets/textfield_with_title.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            heightSpacer(height: 7.h),
            Align(
                alignment: Alignment.centerLeft,
                child: Image.asset('assets/images/logo.png',width: 233.w,height: 126.h,fit: BoxFit.cover,)),
            RichText(text: TextSpan(children: [
              TextSpan(text: "Log",
                  style: appStyle(color: const Color(0xff77D63D),fw: FontWeight.w700,size: 20.sp)),
              TextSpan(text: "In",
                  style: appStyle(color: const Color(0xff000000),fw: FontWeight.w700,size: 20.sp))
            ])),
            heightSpacer(height: 124.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: textFieldWithTitle(title: 'Email Address',hintText: 'Enter Email Address'),
            ),
            heightSpacer(height: 47.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: textFieldWithTitle(title: 'Password',hintText: 'Enter  Password',isPass: true),
            ),
            heightSpacer(height: 7.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Align(
                alignment: Alignment.topRight,
                child: customText(text:'Forget Password?',color: Colors.black.withOpacity(0.8),fw: FontWeight.w400,size: 10.sp),
              ),
            ),
            heightSpacer(height: 56.h),
            customButton(containerWidth: 139.w,
              containerHeight:42.h ,color: const Color(0xff77D63D),title: 'LogIn',),
            heightSpacer(height: 10.h),
            RichText(text: TextSpan(
              children: [
                TextSpan(
                  text: 'Don’t have an account? ',
                  style: appStyle(color:Colors.black ,fw:FontWeight.w500 ,size: 14.sp,),
                ),
                TextSpan(
                  text: 'SignUp',
                  style: appStyle(color:const Color(0xff77D63D) ,fw:FontWeight.w500 ,size: 14.sp,),
                ),
              ]
            ))
          ],
        ),
      ),
    );
  }
}
