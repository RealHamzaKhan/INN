import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inn/const/firebase_const.dart';
import 'package:inn/utils/snackbar.dart';
import 'package:inn/views/auth/login_screen.dart';
import 'package:inn/views/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier{
  final auth=FirebaseAuth.instance;
  bool _showPass=true;
  bool _isLoading=false;
  void setPassStatus(bool passwordStatus){
    _showPass=passwordStatus;
    notifyListeners();
  }
  bool get showPass{
    return _showPass;
  }
  void setLoading(bool isLoading){
    _isLoading=isLoading;
    notifyListeners();
  }
  bool get loadingStatus{
    return _isLoading;
  }
  Future<void> setInitializedRoute()async{
    final SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setBool('loginRoute', true);

  }
  Future<bool> getInitialRoute()async{
    final SharedPreferences pref=await SharedPreferences.getInstance();
   bool initializedRoute= pref.getBool('loginRoute')??false;
    return initializedRoute;

  }
  Future<void> signUp({
    required BuildContext context,
  required final String name,
   required final String email,
   required final String phone,
   required final String password,
    required final String sect,
    required final String gender,
})async{
    try{
      setLoading(true);
      await auth.createUserWithEmailAndPassword(email: email, password: password).then((value){
        firestore.collection(usersCollection).add({
          'uid':value.user!.uid,
          'name':name,
          'email':email,
          'phone':phone,
          'sect':sect,
          'gender':gender,
          'profile_image':'',
          'user_type':'normal',
        });
      });
      showSnackBar(context: context,color:Colors.green ,text: "Account created");
      await login(context: context, email: email, password: password);
    }
    catch(e){
      showSnackBar(context: context,color:Colors.red ,text: e.toString());
    }
    setLoading(false);
  }
  Future<void> login({required BuildContext context,required String email,required String password})async{
    try{
      setLoading(true);
      final SharedPreferences pref=await SharedPreferences.getInstance();
      await auth.signInWithEmailAndPassword(email: email, password: password).then((value){
        pref.setBool('loggedIn', true);
      });
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>
      const Home()), (route) => false);
    }
    catch(e){
      showSnackBar(context: context,color:Colors.red ,text: "An error occured logging in. Kindly login manually");
    }
    setLoading(false);
  }
  Future<void> logout({required BuildContext context})async{
    final SharedPreferences pref=await SharedPreferences.getInstance();
    auth.signOut().then((value){
      pref.setBool('loggedIn', false);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>
      const LoginScreen()), (route) => false);
    });
  }
}