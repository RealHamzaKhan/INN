import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inn/views/common_widgets/custom_button.dart';
import 'package:inn/views/common_widgets/spacers.dart';
import 'package:inn/views/common_widgets/textfield_with_title.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: EdgeInsets.symmetric(vertical: 69.h,horizontal: 22.w
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundImage: const NetworkImage('https://media.istockphoto.com/id/502315060/p'
                      'hoto/middle-eastern-man.jpg?s=2048x2048&w=is&k=20&c=ra7h'
                      'DxUGppKzzuzh9j-1x9r9D2-lkOQtw8IqVL9AomE='),
                  radius: 60.r,
                ),
                Positioned(
                    // bottom: 2.h,
                  bottom: 0.1.h,
                    right: 10.w,
                    child: Icon(Icons.camera_alt,size: 30.w,color: Colors.greenAccent
                      ,))
              ],
            ),
            heightSpacer(height: 60.h),
            textFieldWithTitle(title: "Name",hintText: 'Hamza Raziq Khan'),
            heightSpacer(height: 20.h),
            textFieldWithTitle(title: "Email",hintText: 'zeeshankhan6669@gmail.com'),
            heightSpacer(height: 20.h),
            textFieldWithTitle(title: "Phone Number",hintText: '+9234738483'),
            heightSpacer(height: 20.h),
            textFieldWithTitle(title: "Password",hintText: '******',isPass: true,maxLines: 1),
            heightSpacer(height: 53.h),
            customButton(containerHeight:42.h ,containerWidth: 139.w,color:const Color.fromRGBO(119, 214, 61, 1) ,title: 'Save')
          ],
        ),
      )),
    );
  }
}
