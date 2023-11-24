import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inn/views/onboarding/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'INN',
          theme: ThemeData(
            fontFamily: 'Poppins',
              appBarTheme: const AppBarTheme(
                elevation: 0,
                backgroundColor: Colors.white,
              ),
              primaryColor: Colors.white
          ),
          // You can use the library anywhere in the app even in theme
          home: child,
        );
      },
      child:  const SplashScreen(),
    );
  }
}
