import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inn/const/firebase_const.dart';
import 'package:inn/utils/snackbar.dart';

class UserProvider with ChangeNotifier{
  bool _isLoading=false;
  void setLoading(bool isLoading){
    _isLoading=isLoading;
    notifyListeners();
  }
  bool get loadingStatus{
    return _isLoading;
  }
  Future<String> uploadImage({XFile? sourceImage,String? path})async{
    try {
      if(sourceImage==null){
        return '';
      }

      // Get a reference to the Firebase Storage bucket
      Reference storageRef = FirebaseStorage.instance.ref().child('images/${math.Random.secure().nextInt(1000)}');

      // Upload the image file
      UploadTask uploadTask = storageRef.putFile(File(sourceImage.path));
      // Wait for the upload to complete
      await uploadTask;
      // Get the download URL of the uploaded image
      String downloadURL = await storageRef.getDownloadURL();

      // Save the download URL in Firestore
      return downloadURL;
    } catch (e) {
      log(e.toString());
      return 'error';
    }
  }
  Future<void> updateProfile({
    XFile? image,
    required String name,
    required String email,
    required String phone,
    required BuildContext context,
  }) async {
    try {
      setLoading(true);
      String imageUrl='';
      if (image != null) {

        imageUrl = await uploadImage(sourceImage: image);
        if (imageUrl != 'error') {
          await firestore.collection(usersCollection).where('uid', isEqualTo: user!.uid).get().then((value) {
            firestore.collection(usersCollection).doc(value.docs.first.id).update({
              'profile_image': imageUrl,
              'name': name,
              'email': email,
              'phone': phone,
            });
          });
        }
      }





      await firestore.collection(usersCollection).where('uid', isEqualTo: user!.uid).get().then((value) {
        firestore.collection(usersCollection).doc(value.docs.first.id).update({
          'name': name,
          'email': email,
          'phone': phone,
        });
      });

      setLoading(false);
      showSnackBar(context: context, color: Colors.green, text: 'Profile Updated');
      Navigator.pop(context);
    } catch (e) {
      setLoading(false);
      showSnackBar(context: context, color: Colors.red, text: e.toString());
    }
    setLoading(false);
  }
}