import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inn/const/firebase_const.dart';

class FirebaseServices{
  static getUserDetails({required String uid}){
    return firestore.collection(usersCollection).where('uid',isEqualTo:uid ).snapshots();
  }
  static getPosts({required String userSect}){
    return firestore.collection(postCollection).where('sect',isEqualTo: userSect).orderBy('time',descending: true).snapshots();
  }
  static getPostById({required String docId}){
    return firestore.collection(postCollection).where(FieldPath.documentId, isEqualTo: docId).snapshots();
  }
  static getMuftis({required String sect}){
    return firestore.collection(muftiCollection).where('sect',isEqualTo: sect).snapshots();
  }
  static getMessages({required String chatId}){
    return firestore.collection(chatCollection).doc(chatId).collection('messages').orderBy('timestamp',descending: false).snapshots();
  }
  static getChats(){
    return firestore.collection(chatCollection).where('uids',arrayContains: user!.uid).snapshots();
  }
}