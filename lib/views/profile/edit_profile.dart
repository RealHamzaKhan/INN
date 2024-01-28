import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inn/const/firebase_const.dart';
import 'package:inn/provider/user_provider.dart';
import 'package:inn/services/firebase_services.dart';
import 'package:inn/utils/snackbar.dart';
import 'package:inn/views/common_widgets/custom_button.dart';
import 'package:inn/views/common_widgets/spacers.dart';
import 'package:inn/views/common_widgets/textfield_with_title.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController nameController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController phoneController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  XFile? _image;
  _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _image = pickedFile;
        });
      }
    } catch (e) {
      showSnackBar(context: context,text: 'Unable to pick image',color: Colors.red);
    }
  }

  void fetchUserDetails ()async{
    firestore.collection(usersCollection).where('uid',isEqualTo:user!.uid).get().then((value){
      nameController.text=value.docs.first['name'];
      emailController.text=value.docs.first['email'];
      phoneController.text=value.docs.first['phone'];
    });
  }
  @override
  void initState() {
    fetchUserDetails();
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {

    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: EdgeInsets.symmetric(vertical: 69.h,horizontal: 22.w
        ),
        child: StreamBuilder(stream: FirebaseServices.getUserDetails(uid: user!.uid),
            builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
          if(snapshot.hasError || !snapshot.hasData || snapshot.connectionState==ConnectionState.waiting){
            return  Center(child: CircularProgressIndicator(
              color: Colors.green,
              strokeWidth: 10,
            ),);
          }
          else{
            var data=snapshot.data!.docs.first;
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      data['profile_image']=='' && _image ==null?CircleAvatar(
                        backgroundImage: const NetworkImage('https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                        radius: 60.r,
                      ):_image!=null?CircleAvatar(
                        backgroundImage: FileImage(File(_image!.path)),
                        radius: 60.r,
                      ):CircleAvatar(
                        backgroundImage:  NetworkImage(data['profile_image']),
                        radius: 60.r,
                      ),
                      Positioned(
                        // bottom: 2.h,
                          bottom: 0.1.h,
                          right: 10.w,
                          child: GestureDetector(
                            onTap: (){
                              _pickImage(ImageSource.gallery);
                            },
                            child: Icon(Icons.camera_alt,size: 30.w,color: Colors.greenAccent
                              ,),
                          ))
                    ],
                  ),
                  heightSpacer(height: 60.h),
                  textFieldWithTitle(title: "Name",hintText: data['name'],controller: nameController),
                  heightSpacer(height: 20.h),
                  textFieldWithTitle(title: "Email",hintText: data['email'],controller: emailController),
                  heightSpacer(height: 20.h),
                  textFieldWithTitle(title: "Phone Number",hintText: data['phone'],controller: phoneController),
                  heightSpacer(height: 53.h),
                 Consumer<UserProvider>(builder: (context,provider,child){
                   return provider.loadingStatus?customButton(
                       containerHeight:42.h ,containerWidth: 139.w,color:const Color.fromRGBO(119, 214, 61, 0.3) ,title: 'Save'):
                   customButton(
                       onPress: (){
                         provider.updateProfile(
                           image: _image,
                             name: nameController.text,
                             email: emailController.text,
                             phone: phoneController.text,
                             context: context);
                       },
                       containerHeight:42.h ,containerWidth: 139.w,color:const Color.fromRGBO(119, 214, 61, 1) ,title: 'Save');
                 })
                ],
              ),
            );
          }
            })
      )),
    );
  }
}
