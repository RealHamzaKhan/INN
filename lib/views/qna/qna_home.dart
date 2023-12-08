import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inn/views/common_widgets/custom_text.dart';
import 'package:inn/views/qna/ask_mufti.dart';
import 'package:inn/views/qna/qna_chat.dart';
import '';
class QnaHome extends StatefulWidget {
  const QnaHome({Key? key}) : super(key: key);

  @override
  State<QnaHome> createState() => _QnaHomeState();
}

class _QnaHomeState extends State<QnaHome> {
  int selectedPage=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w,right: 16.w,top: 16.h),
          child:Stack(
            children: [
              selectedPage==1?const QnaChat():const AskMufti(),
              Align(
                alignment: Alignment.topCenter,
                child: CustomSlidingSegmentedControl<int>(

                initialValue: selectedPage,
                height: 45.h,
                isStretch: true,
                children: {
                  1: customText(text: 'Q&A',size: 14.sp,fw: FontWeight.w400),
                  2: customText(text: 'Ask Mufti',size: 14.sp,fw: FontWeight.w400)
                },
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(119, 214, 61, 1),
                  borderRadius: BorderRadius.circular(40),
                ),
                thumbDecoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.3),
                      blurRadius: 4.0,
                      spreadRadius: 1.0,
                      offset: const Offset(
                        0.0,
                        2.0,
                      ),
                    ),
                  ],
                ),
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInToLinear,
                onValueChanged: (v) {
                 setState(() {
                   selectedPage=v;
                 });
                },
      ),
              ),


            ],
          ),
        ),),
    );
  }
}
// selectedPage==1?const QnaChat():const AskMufti()