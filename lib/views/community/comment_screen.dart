import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inn/provider/community_provider.dart';
import 'package:inn/services/firebase_services.dart';
import 'package:inn/views/common_widgets/custom_text.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' as intl;
import '../common_widgets/spacers.dart';

class CommentScreen extends StatefulWidget {
  final String docId;

  const CommentScreen({Key? key, required this.docId}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController commentController=TextEditingController();
  @override
  void dispose() {
    commentController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customText(text: 'Comments',fw: FontWeight.w800,size: 20.sp),
        foregroundColor: Colors.black,

      ),
      body: Column(
        children: [
          StreamBuilder(stream: FirebaseServices.getPostById(docId: widget.docId),

              builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
                if(snapshot.hasError || !snapshot.hasData || snapshot.connectionState==ConnectionState.waiting){
                  return const Expanded(
                    child: Center(child: CircularProgressIndicator(
                      color: Colors.green,
                      strokeWidth: 10,
                    ),),
                  );
                }
                else if(snapshot.data!.docs.first['comments'].length==0){
                  return Expanded(
                    child: Center(child: customText(text: 'NO Comments YET',color: Colors.black.withOpacity(0.4),
                        size: 22.sp,fw: FontWeight.w800
                    ),),
                  );
                }
                else{
                  return Expanded(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data!.docs.first['comments'].length,
                        itemBuilder: (context,index){
                          var commentData=snapshot.data!.docs.first['comments'][index];
                          DateTime dateTime = (commentData['time'] as Timestamp).toDate();
                          String formattedTime = intl.DateFormat.jm().format(dateTime).trim();
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(commentData['profile_image']),
                                    )
                                    , title: customText(text: commentData['name'],fw: FontWeight.w600,size: 14.sp),
                                    subtitle: customText(text: formattedTime.toString(),size: 10.sp),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 20.w
                                    ),
                                    child: customText(text:  commentData['comment'],
                                        size: 12.sp,fw: FontWeight.normal,textAlign: TextAlign.start,textDirection:
                                        TextDirection.ltr),
                                  ),
                                  heightSpacer(height: 3.h),
                                ],
                              ),
                            ),
                          );
                        }),
                  );
              }

              }),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: EdgeInsets.all(10.w),
                child: Consumer<CommunityProvider>(builder: (context,provider,child){
                  return TextFormField(
                    controller: commentController,
                    maxLines: null,
                    decoration:  InputDecoration(
                        suffixIcon:  GestureDetector(
                            onTap: (){
                              provider.addComment(documentId: widget.docId, content: commentController.text);
                              commentController.clear();
                            },
                            child: Icon(Icons.send,color: Colors.greenAccent,)),
                        hintText: "Add comment",
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
                  );
                })
            ),
          )
        ],
      )
    );
  }
}
