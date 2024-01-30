import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inn/const/firebase_const.dart';
import 'package:inn/utils/snackbar.dart';

class CommunityProvider with ChangeNotifier{
  post({required BuildContext context,required String content})async{
    try{
      log('try triggered');
      showSnackBar(context: context,color: Colors.black,text: 'Posting....');
      await firestore.collection(usersCollection).where('uid',isEqualTo: user!.uid).get().then((value) async{
        await firestore.collection(postCollection).add({
          'uid':value.docs.first['uid'],
          'name':value.docs.first['name'],
          'profile_image':value.docs.first['profile_image'],
          'sect':value.docs.first['sect'],
          'likes':[],
          'dislikes':[],
          'comments':[],
          'time':DateTime.timestamp(),
          'content':content,
        });
      });
      showSnackBar(context: context,color: Colors.green,text: 'Posted');
    }
    catch(e){
      log('catch triggered');
      showSnackBar(context: context,color: Colors.red,text: e.toString());
    }
  }

    Future<void> likePost(String postId, String currentUserId) async {
      try {
        final docRef = firestore.collection(postCollection).doc(postId);
        final docSnapshot = await docRef.get();

        if (docSnapshot.exists) {
          final likes = (docSnapshot.data()! as Map<String, dynamic>)['likes'] as List<dynamic>;
          final isLiked = likes.contains(currentUserId);
          final dislikes = (docSnapshot.data()! as Map<String, dynamic>)['dislikes'] as List<dynamic>;
          final isDisLiked = dislikes.contains(currentUserId);

          if (isLiked) {
            // Remove user from likes
            await docRef.update({
              'likes': FieldValue.arrayRemove([currentUserId])
            });
          }
          else if(isDisLiked){
            await docRef.update({
              'dislikes': FieldValue.arrayRemove([currentUserId]),
              'likes':FieldValue.arrayUnion([currentUserId])
            });
          }
          else {
            // Add user to likes
            await docRef.update({
              'likes': FieldValue.arrayUnion([currentUserId])
            });
          }
        } else {
          // Handle the case where the post document doesn't exist
          debugPrint('Post document does not exist: $postId');
        }
      } catch (error) {
        // Handle errors gracefully
        debugPrint('Error liking post: $error');
      }
    }
  Future<void> dislikePost(String postId, String currentUserId) async {
    try {
      final docRef = firestore.collection(postCollection).doc(postId);
      final docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        final dislikes = (docSnapshot.data()! as Map<String, dynamic>)['dislikes'] as List<dynamic>;
        final isDisLiked = dislikes.contains(currentUserId);
        final likes = (docSnapshot.data()! as Map<String, dynamic>)['likes'] as List<dynamic>;
        final isLiked = likes.contains(currentUserId);

        if (isDisLiked) {
          // Remove user from likes
          await docRef.update({
            'dislikes': FieldValue.arrayRemove([currentUserId])
          });
        }
        else if(isLiked){
          await docRef.update({
            'dislikes': FieldValue.arrayUnion([currentUserId]),
            'likes':FieldValue.arrayRemove([currentUserId])
          });
        }
        else {
          // Add user to likes
          await docRef.update({
            'dislikes': FieldValue.arrayUnion([currentUserId])
          });
        }
      } else {
        // Handle the case where the post document doesn't exist
        debugPrint('Post document does not exist: $postId');
      }
    } catch (error) {
      // Handle errors gracefully
      debugPrint('Error liking post: $error');
    }
  }
  addComment({required String documentId,required String content})async{
    String userName='';
    String profileImage='';
    await firestore.collection(usersCollection).where('uid',isEqualTo:user!.uid).get().then((value) {
      userName=value.docs.first['name'];
      profileImage=value.docs.first['profile_image'];
    });
    final comment = {
      'uid': user!.uid,
      'name': userName,
      'comment': content,
      'profile_image':profileImage,
      'time':DateTime.timestamp()
    };
   await firestore.collection(postCollection)
        .doc(documentId)
        .update({
      'comments': FieldValue.arrayUnion([comment])
    })
        .then((value) => debugPrint('Comment added'))
        .catchError((error) => debugPrint('Error adding comment: $error'));
  }

}