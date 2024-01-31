import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inn/views/common_widgets/custom_button.dart';
import 'package:inn/views/common_widgets/custom_text.dart';
import 'package:inn/views/common_widgets/spacers.dart';

class MuftiDetailsScreen extends StatelessWidget {
  var data;
  MuftiDetailsScreen({Key? key,required this.data}) : super(key: key);

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
                    backgroundImage: NetworkImage(data['profile_image']),

                  ),
                ),
                heightSpacer(height: 50.h),
                RichText(text: TextSpan(
                  children: [
                    TextSpan(text: "Name: ",style: appStyle(color:Colors.greenAccent ,
                        size:20.sp ,fw:FontWeight.normal )),
                    TextSpan(text: data['name'],style: appStyle(color:Colors.black ,
                        size:20.sp ,fw:FontWeight.w600 )),
                  ]
                )),
                heightSpacer(height: 10.h),
                RichText(text: TextSpan(
                    children: [
                      TextSpan(text: "Speciality: ",style: appStyle(color:Colors.greenAccent ,
                          size:20.sp ,fw:FontWeight.normal )),
                      TextSpan(text: data['speciality'],style: appStyle(color:Colors.black ,
                          size:20.sp ,fw:FontWeight.w600 )),
                    ]
                )),
                heightSpacer(height: 10.h),
                RichText(text: TextSpan(
                    children: [
                      TextSpan(text: "Sect: ",style: appStyle(color:Colors.greenAccent ,
                          size:20.sp ,fw:FontWeight.normal )),
                      TextSpan(text: data['sect'],style: appStyle(color:Colors.black ,
                          size:20.sp ,fw:FontWeight.w600 )),
                    ]
                )),
                heightSpacer(height: 10.h),
                RichText(text: TextSpan(
                    children: [
                      TextSpan(text: "Description: ",style: appStyle(color:Colors.greenAccent ,
                          size:20.sp ,fw:FontWeight.normal )),
                      TextSpan(text: data['bio'],style: appStyle(color:Colors.black ,
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
