import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inn/views/common_widgets/custom_text.dart';
import 'package:inn/views/common_widgets/spacers.dart';
import 'package:inn/views/common_widgets/textfield_with_title.dart';

import '../common_widgets/custom_button.dart';

class ScholarForm extends StatefulWidget {
  const ScholarForm({Key? key}) : super(key: key);

  @override
  State<ScholarForm> createState() => _ScholarFormState();
}

class _ScholarFormState extends State<ScholarForm> {
  String? selectedSect;
  String? selectedSpeciality;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset('assets/images/logo.png',width: 233.w,height: 126.h,fit: BoxFit.cover,)),
              RichText(text: TextSpan(children: [
                TextSpan(text: 'Scholar ',style: appStyle(color: const Color.fromRGBO(119, 214, 61, 1),size:20 ,fw:
                FontWeight.w700)),
                TextSpan(text: 'SignUp ',style: appStyle(color: Colors.black,size:20 ,fw:
                FontWeight.w700)),
              ])),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heightSpacer(height: 18.h),
                    textFieldWithTitle(title: 'Name',hintText: 'Enter Name'),
                    heightSpacer(height: 20.h),
                    textFieldWithTitle(title: 'Email Address',hintText: 'Enter Email Address'),
                    heightSpacer(height: 20.h),
                    textFieldWithTitle(title: 'Phone Number',hintText: 'Enter Phone Number'),
                    heightSpacer(height: 20.h),
                    textFieldWithTitle(title: 'Name',hintText: 'Enter Name'),
                    heightSpacer(height: 20.h),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(text: "Sect",fw: FontWeight.w500,size: 14.sp),
                        heightSpacer(height: 5.h),
                        Container(
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(217, 217, 217, 0.34)
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: DropdownButton<String>(
                            underline: const SizedBox.shrink(),
                            isExpanded: true,
                            value: selectedSect,
                            hint: customText(text: "Select  Sect",size:14.sp ,fw: FontWeight.w400,),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            iconSize: 24.w,
                            elevation: 0,
                            style: const TextStyle(color: Colors.black),

                            onChanged: ( newValue) {
                              setState(() {
                                selectedSect = newValue!;
                              });
                            },
                            items: <String>['Sunni', 'Shia', 'Barelvi', 'Ehl e Hadees']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    heightSpacer(height: 20.h),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(text: "Speciality",fw: FontWeight.w500,size: 14.sp),
                        heightSpacer(height: 5.h),
                        Container(
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(217, 217, 217, 0.34)
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: DropdownButton<String>(
                            underline: const SizedBox.shrink(),
                            isExpanded: true,
                            value: selectedSpeciality,
                            hint: customText(text: "Select  Speciality",size:14.sp ,fw: FontWeight.w400,),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            iconSize: 24.w,
                            elevation: 0,
                            style: const TextStyle(color: Colors.black),

                            onChanged: ( newValue) {
                              setState(() {
                                selectedSpeciality = newValue!;
                              });
                            },
                            items: <String>['Marriage Affairs', 'Financial Affairs', 'Other']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),

                      ],
                    ),
                    heightSpacer(height: 20.h),
                    textFieldWithTitle(title: 'Bio',hintText: 'Write something about yourself',minLines: 4,maxLines: null),
                    heightSpacer(height: 20.h),
                    customText(text: 'Degree / Certificate'
                    ,size: 14.sp,fw: FontWeight.w500),
                    heightSpacer(height: 5.h),
                    Container(
                      alignment: Alignment.center,
                      height: 126.h,
                      width: 334.w,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(217, 217, 217, 0.34)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          customText(text: 'Upload verified certificate/degree'
                          ,color: Colors.black.withOpacity(0.25),size: 14.sp,fw: FontWeight.w500),
                          Icon(Icons.upload,color: Colors.black.withOpacity(0.25),size: 45.36.w,),
                          customText(text: '*Only pdf or image format'
                              ,color: Colors.black.withOpacity(0.25),size: 14.sp,fw: FontWeight.w500),
                        ],
                      ),
                    ),
                    heightSpacer(height: 13.h),
                    Align(
                        alignment: Alignment.center,
                        child: customButton(containerHeight:42.h ,containerWidth: 139.w,color:const Color.fromRGBO(119, 214, 61, 1) ,title: 'Apply'))

                  ],
                ),
              ),

            ],
          ),
        ),
      )),
    );
  }
}
