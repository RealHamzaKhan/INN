import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inn/views/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context)=>OnBoardingScreen()), (route) => false);
    });
    // TODO: implement initState
    super.initState();
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