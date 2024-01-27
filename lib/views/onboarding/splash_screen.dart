import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inn/views/auth/login_screen.dart';
import 'package:inn/views/home/home.dart';
import 'package:inn/views/onboarding/onboarding_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../provider/auth_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final AuthProvider authProvider;
  Future<void> desiredRoute()async{
    bool getRoute=await authProvider.getInitialRoute();
    final SharedPreferences pref=await SharedPreferences.getInstance();
    bool isLoggedIn=pref.getBool('loggedIn')??false;
    Timer(const Duration(seconds: 3), () {
      if(getRoute){
        if(isLoggedIn){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context)=>const Home()), (route) => false);
        }
        else{
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context)=>const LoginScreen()), (route) => false);
        }

      }
      else{
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context)=>const OnBoardingScreen()), (route) => false);
      }

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    authProvider=Provider.of<AuthProvider>(context);
    desiredRoute();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/logo.png'),fit: BoxFit.fill)
        ),
      ),
    );
  }
}