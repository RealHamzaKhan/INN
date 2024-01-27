import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inn/views/auth/forget_password_screen.dart';
import 'package:inn/views/auth/signup_screen.dart';
import 'package:inn/views/common_widgets/custom_button.dart';
import 'package:inn/views/common_widgets/custom_text.dart';
import 'package:inn/views/common_widgets/spacers.dart';
import 'package:inn/views/common_widgets/textfield_with_title.dart';
import 'package:inn/views/home/home.dart';
import 'package:provider/provider.dart';
import 'package:inn/provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  late final AuthProvider authProvider;
  @override
  void initState() {
    authProvider=context.read<AuthProvider>();
    authProvider.setInitializedRoute();
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            heightSpacer(height: 7.h),
            Align(
                alignment: Alignment.centerLeft,
                child: Image.asset('assets/images/logo.png',width: 233.w,height: 126.h,fit: BoxFit.cover,)),
            RichText(text: TextSpan(children: [
              TextSpan(text: "Log",
                  style: appStyle(color: const Color(0xff77D63D),fw: FontWeight.w700,size: 20.sp)),
              TextSpan(text: "In",
                  style: appStyle(color: const Color(0xff000000),fw: FontWeight.w700,size: 20.sp))
            ])),
            heightSpacer(height: 124.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: textFieldWithTitle(title: 'Email Address',hintText: 'Enter Email Address',controller: emailController),
            ),
            heightSpacer(height: 47.h),
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
            heightSpacer(height: 7.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      const ForgetPasswordScreen()));
                    },
                    child: customText(text:'Forget Password?',color: Colors.black.withOpacity(0.8),fw: FontWeight.w400,size: 10.sp)),
              ),
            ),
            heightSpacer(height: 56.h),
            Consumer<AuthProvider>(builder: (context,provider,child){
              return provider.loadingStatus? customButton(containerWidth: 139.w,
                  containerHeight:42.h ,color: const Color(0xff77D63D).withOpacity(0.3),title: 'LogIn',onPress: (){
                  }):customButton(containerWidth: 139.w,
                  containerHeight:42.h ,color: const Color(0xff77D63D),title: 'LogIn',onPress: (){
                    provider.login(context: context, email: emailController.text, password: passwordController.text);
                  });
            }),
            heightSpacer(height: 10.h),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignupScreen()));
              },
              child: RichText(text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Don’t have an account? ',
                    style: appStyle(color:Colors.black ,fw:FontWeight.w500 ,size: 14.sp,),
                  ),
                  TextSpan(
                    text: 'SignUp',
                    style: appStyle(color:const Color(0xff77D63D) ,fw:FontWeight.w500 ,size: 14.sp,),
                  ),
                ]
              )),
            )
          ],
        ),
      ),
    );
  }
}
