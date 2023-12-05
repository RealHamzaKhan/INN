import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inn/views/chats/message_screen.dart';
import 'package:inn/views/common_widgets/custom_text.dart';
import 'package:inn/views/common_widgets/spacers.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText(text: "Chats",fw: FontWeight.w800,size: 20.sp,color: Colors.black),
            heightSpacer(height: 20.h),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                  itemCount: 20,
                  itemBuilder: (context,index){
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 5.w),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)
                      =>const MessageScreen()));
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: const NetworkImage('https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                          radius: 30.r,
                        ),
                        widthSpacer(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(text: 'Hamza Raziq',fw: FontWeight.w600,size: 16.sp),
                              customText(text: 'This is the last that received',fw: FontWeight.normal,
                                size: 12.sp,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            )
            // ListTile(
            //   dense:false,
            //   contentPadding: EdgeInsets.zero,
            //   leading: Container(
            //     decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       image: DecorationImage(image: NetworkImage('https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'))
            //     ),
            //   ),
            //   title: customText(text: 'Hamza Raziq',fw: FontWeight.w600,size: 14.sp),
            //   subtitle: customText(text: 'This is the last message that received',fw: FontWeight.normal,
            //   size: 12.sp,
            //   ),
            // )
          ],
        ),
      )),
    );
  }
}
