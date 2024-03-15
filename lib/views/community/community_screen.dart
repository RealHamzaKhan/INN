import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inn/const/firebase_const.dart';
import 'package:inn/provider/community_provider.dart';
import 'package:inn/services/firebase_services.dart';
import 'package:inn/views/common_widgets/custom_text.dart';
import 'package:inn/views/common_widgets/spacers.dart';
import 'package:inn/views/community/comment_screen.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' as intl;

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  String userSect='';
  String userProfile='';
  getUserDetails()async{
    await firestore.collection(usersCollection).where('uid',isEqualTo:user!.uid).get().then((value){
      userSect=value.docs.first['sect'];
      userProfile=value.docs.first['profile_image'];
    });
    setState(() {

    });
  }
  final TextEditingController postController=TextEditingController();
  @override
  void initState() {
    getUserDetails();
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    postController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 6.h,horizontal: 10.w),
            child: Column(children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset('assets/images/logo.png',width: 200.w,height: 90.h,fit: BoxFit.cover,)),
              heightSpacer(height: 10.h),
              Row(
            children: [
              userProfile.isEmpty?CircleAvatar(
                radius: 20.r,
                backgroundImage: const NetworkImage('https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
              ):
              CircleAvatar(
                radius: 20.r,
                backgroundImage:  NetworkImage(userProfile),
              ),
              widthSpacer(width: 10.w),
              Consumer<CommunityProvider>(builder: (context,provider,child){
                return Expanded(child: TextFormField(
                  controller: postController,
                  maxLines: null,
                  minLines: 3,
                  decoration:  InputDecoration(
                      suffixIcon: IconButton(onPressed: (){
                        provider.post(context: context, content: postController.text);
                        postController.clear();
                      }, icon: const Icon(Icons.send,color: Colors.green,)),
                      hintText: "Whats on your mind?",
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
                ));
              })
            ],
        ),
              heightSpacer(height: 5.h),
              Divider(color: Colors.black.withOpacity(0.3),thickness: 0.8,),
              heightSpacer(height: 5.h),
              StreamBuilder(stream: FirebaseServices.getPosts(userSect: userSect),
                  builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
                if(!snapshot.hasData || snapshot.hasError || snapshot.connectionState==ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator(
                    color: Colors.green,
                    strokeWidth: 10,
                  ),);
                }
                else if(snapshot.data!.docs.isEmpty){
                  return Center(child: customText(text: 'NO POSTS YET',color: Colors.black.withOpacity(0.4),
                  size: 22.sp,fw: FontWeight.w800
                  ),);
                }
                else{
                  return Expanded(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context,index){
                          var data=snapshot.data!.docs[index];
                          DateTime dateTime = (data['time'] as Timestamp).toDate();
                          String formattedTime = intl.DateFormat.jm().format(dateTime).trim();

                           formattedTime;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                leading:CircleAvatar(
                                  backgroundImage: NetworkImage(data['profile_image']),
                                )
                                , title: customText(text: data['name'],fw: FontWeight.w600,size: 14.sp),
                                subtitle: customText(text: formattedTime.toString(),size: 10.sp),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w
                                ),
                                child: customText(text: data['content'],size: 14.sp,fw: FontWeight.normal,textAlign: TextAlign.start,textDirection:
                                    TextDirection.ltr),
                              ),
                              heightSpacer(height: 3.h),
                              Divider(color: Colors.black.withOpacity(0.3),thickness: 0.4,),
                              Consumer<CommunityProvider>(builder: (context,provider,child){
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        GestureDetector(
                                            onTap: (){
                                              provider.likePost(data.id, user!.uid);
                                            },
                                            child: Icon(Icons.thumb_up,color: data['likes'].contains(user!.uid)?Colors.green:Colors.grey,)),
                                        customText(text: data['likes'].length.toString())
                                      ],
                                    ),
                                    Container(
                                      height: 25.h,
                                      width: 1.w
                                      ,
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                    Column(
                                      children: [
                                        GestureDetector(
                                            onTap: (){
                                              provider.dislikePost(data.id, user!.uid);
                                            },
                                            child: Icon(Icons.thumb_down,color: data['dislikes'].contains(user!.uid)?Colors.green:Colors.grey,)),
                                        customText(text: data['dislikes'].length.toString())
                                      ],
                                    ),
                                    Container(
                                      height: 25.h,
                                      width: 1.w,
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> CommentScreen(docId: data.id)));
                                      },
                                      child: Column(
                                        children: [
                                          Icon(Icons.comment,color: Colors.grey,),
                                          customText(text: data['comments'].length.toString())
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }),
                              heightSpacer(height: 5.h),
                              Divider(color: Colors.black.withOpacity(0.3),thickness: 0.8,),
                            ],
                          );
                        }),
                  );
                }
                  })
      ],),
          )),
    );
  }
}
