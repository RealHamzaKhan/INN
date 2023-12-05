import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inn/views/common_widgets/custom_button.dart';
import 'package:inn/views/common_widgets/custom_text.dart';
import 'package:inn/views/common_widgets/spacers.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customText(text: "Verification Email has been sent to your email. Kindly verify you email to continue with us.",
                  size: 20.sp,color: Colors.black.withOpacity(0.5),fw: FontWeight.normal,textAlign: TextAlign.center),
              heightSpacer(height: 30.h),
              customButton(color: const Color.fromRGBO(119, 214, 61, 1),title: 'Resend',containerHeight:
              50.h,containerWidth: 140.w
              ),
              heightSpacer(height: 30.h),
              customText(text: "Resend in seconds",color: Colors.greenAccent),
              heightSpacer(height: 50.h),
              GestureDetector(
                  onTap: (){
                    // auth.signOut();
                    // Navigator.pop(context);
                  },
                  child: customText(text: "Cancel",color: Colors.red,fw: FontWeight.w900,size: 25.sp)),
              heightSpacer(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}
