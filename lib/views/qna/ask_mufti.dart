import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inn/const/firebase_const.dart';
import 'package:inn/services/firebase_services.dart';
import 'package:inn/views/common_widgets/custom_text.dart';
import 'package:inn/views/common_widgets/spacers.dart';
import 'package:inn/views/qna/mufti_details.dart';

class AskMufti extends StatefulWidget {
  const AskMufti({Key? key}) : super(key: key);

  @override
  State<AskMufti> createState() => _AskMuftiState();
}

class _AskMuftiState extends State<AskMufti> {
  String sect='';
  getSect()async{
    await firestore.collection(usersCollection).where('uid',isEqualTo: user!.uid).get().then((value){
      setState(() {
        sect=value.docs.first['sect'];
      });
    });
  }
  @override
  void initState() {
    getSect();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return sect.isEmpty?Center(child: CircularProgressIndicator(),)
        :StreamBuilder(
        stream:FirebaseServices.getMuftis(sect: sect) ,
        builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
      if(!snapshot.hasData ||snapshot.hasError || snapshot.connectionState==ConnectionState.waiting){
        return const Center(child: CircularProgressIndicator(
          color: Colors.green,
          strokeWidth: 10,
        ),);
          }
      else if(snapshot.data!.docs.isEmpty){
        return Center(child: customText(text: 'No Mufti of your sect',color: Colors.black.withOpacity(0.4),
            size: 22.sp,fw: FontWeight.w800
        ),);
      }
      else{
       return Column(
          children: [
            heightSpacer(height: 60.h),
            Expanded(
              child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context,index){
                    var data=snapshot.data!.docs[index];
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> MuftiDetailsScreen(data: data,)));
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
                                backgroundImage: NetworkImage(data['profile_image']),

                              ),
                              Container(
                                width: 200.w,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    customText(text: data['name'],size:17.sp ,fw:FontWeight.w600 ,color:Colors.black ) ,
                                    customText(text: data['speciality'],size:14.sp ,fw:FontWeight.normal ,color:
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
        });

  }
}
