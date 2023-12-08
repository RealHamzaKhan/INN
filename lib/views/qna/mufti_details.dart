import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inn/views/common_widgets/custom_button.dart';
import 'package:inn/views/common_widgets/custom_text.dart';
import 'package:inn/views/common_widgets/spacers.dart';

class MuftiDetailsScreen extends StatelessWidget {
  const MuftiDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 10.0.h,horizontal: 10.w),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    radius: 100.r,
                    backgroundImage: const NetworkImage('https://images.pexels.com/photos/19285610/pexels-photo-19285610/free-photo-of-elderly-man-with-beard-and-rosary.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),

                  ),
                ),
                heightSpacer(height: 50.h),
                RichText(text: TextSpan(
                  children: [
                    TextSpan(text: "Name: ",style: appStyle(color:Colors.greenAccent ,
                        size:20.sp ,fw:FontWeight.normal )),
                    TextSpan(text: "Muhammad Esa Khan",style: appStyle(color:Colors.black ,
                        size:20.sp ,fw:FontWeight.w600 )),
                  ]
                )),
                heightSpacer(height: 10.h),
                RichText(text: TextSpan(
                    children: [
                      TextSpan(text: "Speciality: ",style: appStyle(color:Colors.greenAccent ,
                          size:20.sp ,fw:FontWeight.normal )),
                      TextSpan(text: "Marriage Affairs",style: appStyle(color:Colors.black ,
                          size:20.sp ,fw:FontWeight.w600 )),
                    ]
                )),
                heightSpacer(height: 10.h),
                RichText(text: TextSpan(
                    children: [
                      TextSpan(text: "Sect: ",style: appStyle(color:Colors.greenAccent ,
                          size:20.sp ,fw:FontWeight.normal )),
                      TextSpan(text: "Sunni",style: appStyle(color:Colors.black ,
                          size:20.sp ,fw:FontWeight.w600 )),
                    ]
                )),
                heightSpacer(height: 10.h),
                RichText(text: TextSpan(
                    children: [
                      TextSpan(text: "Description: ",style: appStyle(color:Colors.greenAccent ,
                          size:20.sp ,fw:FontWeight.normal )),
                      TextSpan(text: "orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",style: appStyle(color:Colors.black ,
                          size:14.sp ,fw:FontWeight.normal )),
                    ]
                )),
              ],
            ),
            Align(alignment: Alignment.bottomCenter,
            child: customButton(containerHeight: 40.h,containerWidth: double.infinity,
            color: Colors.greenAccent,title: "Ask This Mufti"),
            )
          ],
        ),
      )),
    );
  }
}
