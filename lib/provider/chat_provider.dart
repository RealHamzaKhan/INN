import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:inn/const/firebase_const.dart';

class ChatProvider with ChangeNotifier{
  Future<void> sendMessage(String message,String receiverName,String receiverUid,String chatId,String profileImage) async {
    try {
      // Check if the chat document exists
      final chatDoc = FirebaseFirestore.instance.collection('chats').doc(chatId);
      final chatData = await chatDoc.get();
      if (!chatData.exists) {
        // Create a new chat document if it doesn't exist
        await chatDoc.set({});
      }
      chatDoc.update({
        'chat_id':chatId,
        'profile_image':profileImage,
        'last_message':message,
        'receiver_name':receiverName,
        'uids':[user!.uid,receiverUid],
        'senderUid': user!.uid,
        'receiverUid': receiverUid,
      });

      // Add the message to the chat subcollection
      await chatDoc.collection('messages').add({
        'senderUid': user!.uid,
        'receiverUid': receiverUid,
        'message': message,
        'timestamp': Timestamp.now(),
      });
    } catch (e) {
      print("Error sending message: $e");
    }
  }
}