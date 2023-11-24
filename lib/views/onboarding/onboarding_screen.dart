import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inn/views/auth/login_screen.dart';
import 'package:inn/views/common_widgets/custom_button.dart';
import 'package:inn/views/common_widgets/custom_text.dart';
import 'package:inn/views/common_widgets/spacers.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 23.h,vertical: 37.h),
                child: Column(
                  children: [
                    Image.asset('assets/images/onboard1.png',height:351.h ,width: 354.w,),
                    heightSpacer(height: 50.h),
                    customText(text: 'Welcome to',size: 24.sp,color: Colors.black,fw: FontWeight.w800),
                    RichText(text: TextSpan(
                      children: [
                        TextSpan(text: 'FAITH ',style: appStyle(
                          color: const Color(0xff77D63D),
                          size: 24.sp,
                          fw: FontWeight.w800,
                        )),
                        TextSpan(text: 'KNOWLEDGE',style: appStyle(
                          color: Colors.black,
                          size: 24.sp,
                          fw: FontWeight.w800,
                        )),
                      ]
                    )),
                    heightSpacer(height: 20.h),
                    customText(
                      text: ''
                          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-l'
                          '',
                      textAlign: TextAlign.center,
                      fw: FontWeight.w500,
                      size: 14.sp
                    ),
                    heightSpacer(height: 115.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customButton(
                          containerHeight: 42.h,
                          containerWidth: 139.w,
                          onPress: (){
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>
                            const LoginScreen()), (route) => false);
                             },
                          color: const Color(0xff77D63D),
                          title: "Skip",
                        ),
                        customButton(
                          containerHeight: 42.h,
                          containerWidth: 139.w,
                          onPress: (){
                            controller.animateToPage(1, duration: Duration(milliseconds: 300), curve: Curves.ease);

                          },
                          color: const Color(0xff77D63D),
                          title: "Next",
                        ),
                      ],
                    )

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 23.h,vertical: 37.h),
                child: Column(
                  children: [
                    Image.asset('assets/images/onboard2.png',height:351.h ,width: 354.w,),
                    heightSpacer(height: 50.h),
                    customText(text: 'Get Information From',size: 24.sp,color: Colors.black,fw: FontWeight.w800),
                    RichText(text: TextSpan(
                        children: [
                          TextSpan(text: 'Mufti ',style: appStyle(
                            color: const Color(0xff77D63D),
                            size: 24.sp,
                            fw: FontWeight.w800,
                          )),

                        ]
                    )),
                    heightSpacer(height: 20.h),
                    customText(
                        text: ''
                            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-l'
                            '',
                        textAlign: TextAlign.center,
                        fw: FontWeight.w500,
                        size: 14.sp
                    ),
                    heightSpacer(height: 115.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customButton(
                          containerHeight: 42.h,
                          containerWidth: 139.w,
                          onPress: (){
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>
                            const LoginScreen()), (route) => false);
                            },
                          color: const Color(0xff77D63D),
                          title: "Skip",
                        ),
                        customButton(
                          containerHeight: 42.h,
                          containerWidth: 139.w,
                          onPress: (){
                            controller.animateToPage(2, duration: Duration(milliseconds: 300), curve: Curves.ease);

                          },
                          color: const Color(0xff77D63D),
                          title: "Next",
                        ),
                      ],
                    )

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 23.h,vertical: 37.h),
                child: Column(
                  children: [
                    Image.asset('assets/images/onboard3.png',height:351.h ,width: 354.w,),
                    heightSpacer(height: 50.h),
                    customText(text: 'Let your Questions be',size: 24.sp,color: Colors.black,fw: FontWeight.w800),
                    RichText(text: TextSpan(
                        children: [
                          TextSpan(text: 'answered by an ',style: appStyle(

                            color: Colors.black,
                            size: 24.sp,
                            fw: FontWeight.w800,
                          )),
                          TextSpan(text: 'AI-Bot',style: appStyle(
                            color: const Color(0xff77D63D),
                            size: 24.sp,
                            fw: FontWeight.w800,
                          )),
                        ]
                    )),
                    heightSpacer(height: 20.h),
                    customText(
                        text: ''
                            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-l'
                            '',
                        textAlign: TextAlign.center,
                        fw: FontWeight.w500,
                        size: 14.sp
                    ),
                    heightSpacer(height: 115.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Container()),
                        customButton(
                          containerHeight: 42.h,
                          containerWidth: 139.w,
                          onPress: (){
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>
                            const LoginScreen()), (route) => false);
                          },
                          color: const Color(0xff77D63D),
                          title: "Get Started",
                        ),
                      ],
                    )

                  ],
                ),
              ),

            ],
          ),
          Positioned(
            bottom: 112.h,
            left: 144.w,
            child: SmoothPageIndicator(
            controller: controller, count: 3,
            effect: const ExpandingDotsEffect(
              activeDotColor: Colors.black,
              dotHeight: 16,
              dotWidth: 16,
            ),
          ),),
        ],
      )
    );
  }
}
