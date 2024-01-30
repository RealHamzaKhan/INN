import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inn/provider/auth_provider.dart';
import 'package:inn/provider/community_provider.dart';
import 'package:inn/provider/init_provider.dart';
import 'package:inn/provider/user_provider.dart';
import 'package:inn/views/onboarding/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
// Future<void> change()async{
//   final SharedPreferences preferences=await SharedPreferences.getInstance();
//   preferences.setBool('loginRoute', false);
// }
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>AuthProvider()),
      ChangeNotifierProvider(create: (context)=>InitProvider()),
      ChangeNotifierProvider(create: (context)=>UserProvider()),
      ChangeNotifierProvider(create: (context)=>CommunityProvider())

    ],
    child: ScreenUtilInit(
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
    ),);
  }
}
