import 'package:inn/const/firebase_const.dart';

class FirebaseServices{
  static getUserDetails({required String uid}){
    return firestore.collection(usersCollection).where('uid',isEqualTo:uid ).snapshots();
  }
}