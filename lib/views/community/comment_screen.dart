import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inn/views/common_widgets/custom_text.dart';

import '../common_widgets/spacers.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customText(text: 'Comments',fw: FontWeight.w800,size: 20.sp),
        automaticallyImplyLeading: true,
        foregroundColor: Colors.black,

      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context,index){
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
                                size: 12.sp,fw: FontWeight.normal,textAlign: TextAlign.start,textDirection:
                                TextDirection.ltr),
                          ),
                          heightSpacer(height: 3.h),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.all(10.w),
              child: TextFormField(
                maxLines: null,
                decoration:  InputDecoration(
                    suffixIcon: const Icon(Icons.send,color: Colors.greenAccent,),
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
              ),
            ),
          )
        ],
      ),
    );
  }
}
