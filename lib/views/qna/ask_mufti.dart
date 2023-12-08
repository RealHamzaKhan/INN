import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inn/views/common_widgets/custom_text.dart';
import 'package:inn/views/common_widgets/spacers.dart';
import 'package:inn/views/qna/mufti_details.dart';

class AskMufti extends StatelessWidget {
  const AskMufti({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        heightSpacer(height: 60.h),
        Expanded(
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const MuftiDetailsScreen()));
              },
              child: Card(
                elevation: 0,
                color: Colors.greenAccent.withOpacity(0.3),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 40.h,
                        backgroundImage: const NetworkImage('https://images.pexels.com/photos/19285610/pexels-photo-19285610/free-photo-of-elderly-man-with-beard-and-rosary.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),

                      ),
                      Container(
                        width: 200.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText(text: 'Muhammad Essa',size:17.sp ,fw:FontWeight.w600 ,color:Colors.black ) ,
                            customText(text: "Merriage Affairs",size:14.sp ,fw:FontWeight.normal ,color:
                            Colors.black.withOpacity(0.5)),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
                ),
                //       child: ListTile(
                //         leading: CircleAvatar(
                //           radius: 30.r,
                // backgroundImage: NetworkImage('https://images.pexels.com/photos/19285610/pexels-photo-19285610/free-photo-of-elderly-man-with-beard-and-rosary.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                // ),
                //         title:customText(text: 'Muhammad Essa') ,
                //         subtitle: customText(text: "Merriage Affairs"),
                //         trailing: Icon(Icons.arrow_forward_ios_rounded),
                //       ),
              ),
            );
          }),
        ),

      ],
    );

  }
}
