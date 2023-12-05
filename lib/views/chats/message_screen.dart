import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inn/views/common_widgets/custom_text.dart';
import 'package:inn/views/common_widgets/spacers.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customText(text: "Hamza Raziq Khan",fw: FontWeight.w800,size: 20.sp),
        automaticallyImplyLeading: true,
        foregroundColor: Colors.black,
      ),
      body: Container(
        height: double.infinity,
        child: Column(
          children: [
            Expanded(

              child: ListView.builder(
                  itemCount: 20,
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
                  Icon(Icons.send,color: Colors.greenAccent,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
