

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inn/views/auth/forget_password_screen.dart';
import 'package:inn/views/auth/signup_screen.dart';
import 'package:inn/views/common_widgets/custom_button.dart';
import 'package:inn/views/common_widgets/custom_text.dart';
import 'package:inn/views/common_widgets/spacers.dart';
import 'package:inn/views/common_widgets/textfield_with_title.dart';
import 'package:inn/views/home/home.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      const ForgetPasswordScreen()));
                    },
                    child: customText(text:'Forget Password?',color: Colors.black.withOpacity(0.8),fw: FontWeight.w400,size: 10.sp)),
              ),
            ),
            heightSpacer(height: 56.h),
            customButton(containerWidth: 139.w,
              containerHeight:42.h ,color: const Color(0xff77D63D),title: 'LogIn',onPress: (){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)
              =>const Home()), (route) => false);
                }),
            heightSpacer(height: 10.h),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignupScreen()));
              },
              child: RichText(text: TextSpan(
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
              )),
            )
          ],
        ),
      ),
    );
  }
}
