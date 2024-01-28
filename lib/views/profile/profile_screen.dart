
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inn/const/firebase_const.dart';
import 'package:inn/services/firebase_services.dart';
import 'package:inn/views/common_widgets/custom_button.dart';
import 'package:inn/views/common_widgets/custom_text.dart';
import 'package:inn/views/common_widgets/profile_custom_widget.dart';
import 'package:inn/views/common_widgets/spacers.dart';
import 'package:inn/views/profile/edit_profile.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../provider/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: StreamBuilder(
              stream: FirebaseServices.getUserDetails(uid: user!.uid),
              builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
                if(!snapshot.hasData || snapshot.connectionState==ConnectionState.waiting || snapshot.hasError){
                  return Center(child: CircularProgressIndicator(
                    color: Colors.green,
                    strokeWidth: 10,
                  ),);
                  // return Shimmer(
                  //   gradient: LinearGradient(
                  //     colors: [
                  //       // Customize these colors for different shades of green
                  //       Colors.teal.shade200,
                  //       Colors.teal.shade300,
                  //       Colors.teal.shade400,
                  //       Colors.teal.shade500,
                  //     ],
                  //     stops: [0.1, 0.2, 0.3, 0.4],
                  //   ),
                  //   child: Container(
                  //     color: Colors.teal.shade50,
                  //   ),
                  // );
                }
                else{
                  return Stack(
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
                              snapshot.data!.docs.first['profile_image']==''?
                              CircleAvatar(
                                backgroundImage: const NetworkImage('https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                                radius: 60.r,
                              ):CircleAvatar(
                                backgroundImage:  NetworkImage(snapshot.data!.docs.first['profile_image']),
                                radius: 60.r,
                              ),
                              heightSpacer(height: 10.h),
                              RichText(text: TextSpan(
                                  children: [
                                    TextSpan(text: '${snapshot.data!.docs.first['name']}',style: appStyle(fw: FontWeight.w800,size: 20.sp
                                        ,color: Colors.black)),
                                    TextSpan(text: ' (${snapshot.data!.docs.first['sect']})',style: appStyle(fw: FontWeight.normal,size: 14.sp,color:
                                    Colors.black.withOpacity(0.5))),
                                  ]
                              )),
                              heightSpacer(height: 2.h),
                              customText(text: '${snapshot.data!.docs.first['gender']}',fw: FontWeight.normal,size: 14.sp,color: Colors.black.withOpacity(0.4)),
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
                  );
                }
              })
      ),
    );
  }
}
