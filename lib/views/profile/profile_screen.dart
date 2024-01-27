
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inn/views/common_widgets/custom_button.dart';
import 'package:inn/views/common_widgets/custom_text.dart';
import 'package:inn/views/common_widgets/profile_custom_widget.dart';
import 'package:inn/views/common_widgets/spacers.dart';
import 'package:inn/views/profile/edit_profile.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 100.h,
              width: 250.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100.w),bottomRight:
                  Radius.circular(40.w),topLeft: Radius.circular(20.r)),
                  color:const Color.fromRGBO(119, 214, 61, 10)
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 55.h),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: const NetworkImage('https://media.istockphoto.com/id/502315060/p'
                        'hoto/middle-eastern-man.jpg?s=2048x2048&w=is&k=20&c=ra7h'
                        'DxUGppKzzuzh9j-1x9r9D2-lkOQtw8IqVL9AomE='),
                    radius: 60.r,
                  ),
                  heightSpacer(height: 10.h),
                  RichText(text: TextSpan(
                    children: [
                      TextSpan(text: 'Hamza Raziq Khan',style: appStyle(fw: FontWeight.w800,size: 20.sp
                      ,color: Colors.black)),
                      TextSpan(text: ' (Sunni)',style: appStyle(fw: FontWeight.normal,size: 14.sp,color: 
                      Colors.black.withOpacity(0.5))),
                    ]
                  )),
                  heightSpacer(height: 2.h),
                  customText(text: 'Male',fw: FontWeight.normal,size: 14.sp,color: Colors.black.withOpacity(0.4)),
                  heightSpacer(height: 60.h),
                  profileCustomWidget(text: 'Edit Profile', iconData: Icons.person_2_outlined, onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const EditProfile()));
                  }),
                  heightSpacer(height: 10.h),
                  profileCustomWidget(text: 'Help And Support', iconData: Icons.help, onTap: (){}),
                  heightSpacer(height: 60.h),
                 Consumer<AuthProvider>(builder: (context,provider,child){
                   return customButton(
                       onPress: (){
                         provider.logout(context: context);
                       },
                       containerWidth: 139.w,
                       containerHeight:42.h ,
                       title: 'LogOut',color: Color.fromRGBO(119, 214, 61, 1));
                 })
                ],
              ),
            ),
          )
        ],
      ),
      ),
    );
  }
}
