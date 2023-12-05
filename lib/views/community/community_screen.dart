import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inn/views/common_widgets/custom_text.dart';
import 'package:inn/views/common_widgets/spacers.dart';
import 'package:inn/views/community/comment_screen.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
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
              CircleAvatar(
                radius: 20.r,
                backgroundImage: const NetworkImage('https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
              ),
              widthSpacer(width: 10.w),
              Expanded(child: TextFormField(
                maxLines: null,
                minLines: 3,
                decoration:  InputDecoration(
                  suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.send,color: Colors.green,)),
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
              ))
            ],
        ),
              heightSpacer(height: 5.h),
              Divider(color: Colors.black.withOpacity(0.3),thickness: 0.8,),
              heightSpacer(height: 5.h),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context,index){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading:const CircleAvatar(
                          backgroundImage: NetworkImage('https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                        )
                        , title: customText(text: 'Hamza',fw: FontWeight.w600,size: 14.sp),
                        subtitle: customText(text: '9:15 pm',size: 10.sp),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w
                        ),
                        child: customText(text: ''
                            'This is a dummy text i.e '
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, ake a type specimen book. It has survived not only five centuries, ith the release of Letraseting versions of Lorem Ipsum.',
                            size: 14.sp,fw: FontWeight.normal,textAlign: TextAlign.start,textDirection:
                            TextDirection.ltr),
                      ),
                      heightSpacer(height: 3.h),
                      Divider(color: Colors.black.withOpacity(0.3),thickness: 0.4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.thumb_up,color: Colors.grey,),
                              customText(text: '20')
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
                              Icon(Icons.thumb_down,color: Colors.grey,),
                              customText(text: '2')
                            ],
                          ),
                          Container(
                            height: 25.h,
                            width: 1.w
                            ,
                            color: Colors.black.withOpacity(0.6),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const CommentScreen()));
                            },
                            child: Column(
                              children: [
                                Icon(Icons.comment,color: Colors.grey,),
                                customText(text: '14')
                              ],
                            ),
                          ),
                        ],
                      ),
                      heightSpacer(height: 5.h),
                      Divider(color: Colors.black.withOpacity(0.3),thickness: 0.8,),
                    ],
                  );
                }),
              )
      ],),
          )),
    );
  }
}
