import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inn/views/common_widgets/custom_button.dart';
import 'package:inn/views/common_widgets/custom_text.dart';
import 'package:inn/views/common_widgets/spacers.dart';
import 'package:inn/views/common_widgets/textfield_with_title.dart';
import 'email_verification.dart';
class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 22.h,horizontal: 11.w
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios_new,size: 30.w,)),
                  Container(
                    alignment: Alignment.center,
                    height: 100.h,
                    width: 250.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100.w),bottomRight: 
                      Radius.circular(40.w),topLeft: Radius.circular(20.w)),
                        color:const Color.fromRGBO(119, 214, 61, 10)
                    ),
                    child:customText(text: "Forgot Password",fw:FontWeight.w600 ,size: 20.sp),
                  ),
                ],
              ),
              heightSpacer(height: 140.h),
              customText(text: 'Mail Address Here',color: const Color.fromRGBO(119, 214, 61, 10),
              fw:FontWeight.w600 ,size: 20.sp),
              heightSpacer(height: 5.h),
              customText(text:'Enter the email address associated with your account.' ,fw:FontWeight.w300 ,
                  size:14.sp, textAlign: TextAlign.center),
              heightSpacer(height: 15.h),
              textFieldWithTitle(
                title: 'Email Address',
                hintText:'Enter Email Address' ,
              ),
              heightSpacer(height: 30.h),
              customButton(containerHeight:40.h ,containerWidth:189.w ,title: "Recover Password",color:
              const Color.fromRGBO(119, 214, 61, 1),onPress: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                const EmailVerification()));
              })
            ],
          ),
        ),
      ),
    );
  }
}
