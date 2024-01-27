
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inn/utils/snackbar.dart';
import 'package:inn/views/auth/login_screen.dart';
import 'package:inn/views/common_widgets/custom_button.dart';
import 'package:inn/views/common_widgets/custom_text.dart';
import 'package:inn/views/common_widgets/spacers.dart';
import 'package:inn/views/common_widgets/textfield_with_title.dart';
import 'package:provider/provider.dart';
import 'package:inn/provider/auth_provider.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController phoneController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
   String? selectedSect;
   String? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              heightSpacer(height: 7.h),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset('assets/images/logo.png',width: 233.w,height: 126.h,fit: BoxFit.cover,)),
              RichText(text: TextSpan(children: [
                TextSpan(text: "Sign",
                    style: appStyle(color: const Color(0xff77D63D),fw: FontWeight.w700,size: 20.sp)),
                TextSpan(text: "Up",
                    style: appStyle(color: const Color(0xff000000),fw: FontWeight.w700,size: 20.sp))
              ])),
              heightSpacer(height: 18.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: textFieldWithTitle(title: 'Name',hintText: 'Enter Name',controller: nameController),
              ),
              heightSpacer(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: textFieldWithTitle(title: 'Email Address',hintText: 'Enter Email Address',controller: emailController,
                keyboardtype: TextInputType.emailAddress),
              ),
              heightSpacer(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: textFieldWithTitle(title: 'Phone Number',hintText: 'Enter  Phone Number',controller: phoneController,
                keyboardtype: TextInputType.phone),
              ),
              heightSpacer(height: 20.h),
              Consumer<AuthProvider>(builder: (context,provider,child){
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      customText(text: 'Password',color: Colors.black,fw:FontWeight.w500 ,size: 14.sp),
                      heightSpacer(height: 5.h),
                      TextFormField(
                        controller: passwordController,
                        maxLines: 1,
                        obscureText: provider.showPass,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(onPressed: (){
                              provider.setPassStatus(!provider.showPass);
                            }, icon: provider.showPass?Icon(Icons.visibility):Icon(Icons.visibility_off)),
                            hintText: 'Enter Password',
                            contentPadding:  EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromRGBO(217, 217, 217, 1)),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromRGBO(217, 217, 217, 0.34)),
                            ),
                            filled: true,
                            fillColor: const Color.fromRGBO(217, 217, 217, 0.34)
                        )
                      )
                    ],
                  )
                );
              }),
              heightSpacer(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
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
            ),
              heightSpacer(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText(text: "Gender",fw: FontWeight.w500,size: 14.sp),
                    heightSpacer(height: 5.h),
                    Container(
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(217, 217, 217, 0.34)
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: DropdownButton<String>(
                        underline: const SizedBox.shrink(),
                        isExpanded: true,
                        value: selectedGender,
                        hint: customText(text: "Select  Gender",size:14.sp ,fw: FontWeight.w400,),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        iconSize: 24.w,
                        elevation: 0,
                        style: const TextStyle(color: Colors.black),

                        onChanged: ( newValue) {
                          setState(() {
                            selectedGender = newValue!;
                          });
                        },
                        items: <String>['Male', 'Female', 'Other']
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
              ),
              heightSpacer(height: 30.h),
              Consumer<AuthProvider>(builder: (context,provider,child){
                return provider.loadingStatus?customButton(
                  containerWidth: 139.w,
                  containerHeight:42.h ,color: const Color(0xff77D63D).withOpacity(0.3),title: 'SignUp',):customButton(
                  onPress: (){
                    if(nameController.text.isEmpty | passwordController.text.isEmpty
                    | emailController.text.isEmpty | (selectedSect?.isEmpty ?? true) | (selectedGender?.isEmpty ?? true)
                    | phoneController.text.isEmpty
                    ){
                      showSnackBar(context: context,text: 'Kindly fill all the required fields',
                      color: Colors.red);
                    }
                    else{
                      provider.signUp(
                          context: context,
                          name: nameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                          password: passwordController.text,
                          sect: selectedSect!,
                          gender: selectedGender!);
                    }
                  },
                  containerWidth: 139.w,
                  containerHeight:42.h ,color: const Color(0xff77D63D),title: 'SignUp',);

              }),
              heightSpacer(height: 10.h),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: RichText(text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account? ',
                        style: appStyle(color:Colors.black ,fw:FontWeight.w500 ,size: 14.sp,),
                      ),
                      TextSpan(
                        text: 'LogIn',
                        style: appStyle(color:const Color(0xff77D63D) ,fw:FontWeight.w500 ,size: 14.sp,),
                      ),
                    ]
                )),
              ),
              heightSpacer(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }
}
