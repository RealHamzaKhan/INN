import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inn/const/firebase_const.dart';
import 'package:inn/provider/chat_provider.dart';
import 'package:inn/services/firebase_services.dart';
import 'package:inn/views/common_widgets/custom_text.dart';
import 'package:inn/views/common_widgets/spacers.dart';
import 'package:intl/intl.dart' as intl;

class MessageScreen extends StatefulWidget {
  final String receiverName;
  final String receiverUid;
  final String profileImage;
  const MessageScreen({Key? key, required this.receiverName, required this.receiverUid, required this.profileImage}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  String generateChatId(String uid1, String uid2) {
    // Sort UIDs alphabetically and concatenate them
    List<String> uids = [uid1, uid2];
    uids.sort();
    return uids.join('');
  }
  TextEditingController messageController=TextEditingController();
  @override
  void dispose() {
    messageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final chatId=generateChatId(widget.receiverUid, user!.uid);
    return Scaffold(
      appBar: AppBar(
        title: customText(text: widget.receiverName,fw: FontWeight.w800,size: 20.sp),
        automaticallyImplyLeading: true,
        foregroundColor: Colors.black,
      ),
      body: StreamBuilder(stream: FirebaseServices.getMessages(chatId: chatId),
          builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
        if(snapshot.hasError ){
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
             backgroundColor: Colors.red,
             content: customText(
             text: "Cannot retrieve messages kindly check your internet connection",
           ),));
           return Container(
             height: double.infinity,
             child: Column(
               children: [
                 Expanded(

                   child: ListView.builder(
                       itemCount: 0,
                       physics: const BouncingScrollPhysics(),
                       itemBuilder: (context,index){return
                         Column(
                           children: [
                             Align(
                               alignment: Alignment.centerLeft,
                               child: Padding(
                                 padding: EdgeInsets.all(8.0.dm),
                                 child: Container(
                                   width: 250.w,
                                   padding: EdgeInsets.all(10.dm),
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(15.r),
                                     color: Colors.greenAccent,
                                   ),
                                   child: Column(
                                     children: [
                                       customText(text: 'Hamza khan is here how are you'),
                                       heightSpacer(height: 5.h),
                                       Align(
                                           alignment: Alignment.centerRight,
                                           child: customText(text: '10:14 pm',size: 10))
                                     ],
                                   ),
                                 ),
                               ),
                             ),
                             Align(
                               alignment: Alignment.centerRight,
                               child: Padding(
                                 padding: EdgeInsets.all(8.0.dm),
                                 child: Container(
                                   width: 250.w,
                                   padding: EdgeInsets.all(10.dm),
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(15.r),
                                     color: Colors.grey.withOpacity(0.3),
                                   ),
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       customText(text: 'SHeerry is here how are you'),
                                       heightSpacer(height: 5.h),
                                       Align(
                                           alignment: Alignment.centerRight,
                                           child: customText(text: '10:14 pm',size: 10))
                                     ],
                                   ),
                                 ),
                               ),
                             ),
                           ],
                         );}),
                 ),
                 Padding(
                   padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
                   child: Row(
                     children: [
                       Expanded(child: TextFormField(
                         controller: messageController,
                         maxLines: null,
                         decoration:  InputDecoration(
                             hintText: "Message ...",
                             contentPadding:  EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                             focusedBorder: const OutlineInputBorder(
                               borderSide: BorderSide(color: Color.fromRGBO(217, 217, 217, 1)),
                             ),
                             enabledBorder: const OutlineInputBorder(
                               borderSide: BorderSide(color: Color.fromRGBO(217, 217, 217, 0.34)),
                             ),
                             filled: true,
                             fillColor: const Color.fromRGBO(217, 217, 217, 0.34)
                         ),
                       )),
                       widthSpacer(width: 7.w),
                       GestureDetector(
                           onTap: (){
                             ChatProvider().sendMessage(messageController.text, widget.receiverName, widget.receiverUid,chatId,widget.profileImage);
                             messageController.clear();
                           },
                           child: Icon(Icons.send,color: Colors.greenAccent,))
                     ],
                   ),
                 )
               ],
             ),
           );
        }

        else if(snapshot.data!.docs.isEmpty){
          return Container(
            height: double.infinity,
            child: Column(
              children: [
                Expanded(
                  child: Center(child: customText(text: "NO messages"))
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
                  child: Row(
                    children: [
                      Expanded(child: TextFormField(
                        controller: messageController,
                        maxLines: null,
                        decoration:  InputDecoration(
                            hintText: "Message ...",
                            contentPadding:  EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromRGBO(217, 217, 217, 1)),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromRGBO(217, 217, 217, 0.34)),
                            ),
                            filled: true,
                            fillColor: const Color.fromRGBO(217, 217, 217, 0.34)
                        ),
                      )),
                      widthSpacer(width: 7.w),
                      GestureDetector(
                          onTap: (){
                            ChatProvider().sendMessage(messageController.text, widget.receiverName, widget.receiverUid,chatId,widget.profileImage);
                            messageController.clear();
                          },
                          child: Icon(Icons.send,color: Colors.greenAccent,))
                    ],
                  ),
                )
              ],
            ),
          );
        }
        else{
          return Container(
            height: double.infinity,
            child: Column(
              children: [
                Expanded(

                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context,index){
                        var snap=snapshot.data!.docs[index];
                        DateTime dateTime = (snap['timestamp'] as Timestamp).toDate();
                        String formattedTime = intl.DateFormat.jm().format(dateTime).trim();
                        return Column(
                          children: [
                          snap['senderUid']!=user!.uid ? Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.all(8.0.dm),
                                child: Container(
                                  width: 250.w,
                                  padding: EdgeInsets.all(10.dm),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    color: Colors.greenAccent,
                                  ),
                                  child: Column(
                                    children: [
                                      customText(text: snap['message']),
                                      heightSpacer(height: 5.h),
                                      Align(
                                          alignment: Alignment.centerRight,
                                          child: customText(text: formattedTime.toString(),size: 10))
                                    ],
                                  ),
                                ),
                              ),
                            ):
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.all(8.0.dm),
                                child: Container(
                                  width: 250.w,
                                  padding: EdgeInsets.all(10.dm),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    color: Colors.grey.withOpacity(0.3),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      customText(text: snap['message']),
                                      heightSpacer(height: 5.h),
                                      Align(
                                          alignment: Alignment.centerRight,
                                          child: customText(text: formattedTime.toString().toString(),size: 10))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );}),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
                  child: Row(
                    children: [
                      Expanded(child: TextFormField(
                        controller: messageController,
                        maxLines: null,
                        decoration:  InputDecoration(
                            hintText: "Message ...",
                            contentPadding:  EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromRGBO(217, 217, 217, 1)),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromRGBO(217, 217, 217, 0.34)),
                            ),
                            filled: true,
                            fillColor: const Color.fromRGBO(217, 217, 217, 0.34)
                        ),
                      )),
                      widthSpacer(width: 7.w),
                      GestureDetector(
                          onTap: (){
                            ChatProvider().sendMessage(messageController.text, widget.receiverName, widget.receiverUid,chatId,widget.profileImage);
                            messageController.clear();
                          },
                          child: Icon(Icons.send,color: Colors.greenAccent,))
                    ],
                  ),
                )
              ],
            ),
          );
        }
          })
    );
  }
}
