import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inn/views/chats/chat_screen.dart';
import 'package:inn/views/community/community_screen.dart';
import 'package:inn/views/home/home_scren.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CommunityScreen(),
    Text(
      'Index 2: School',
    ),
    ChatScreen(),
    Text(
      'Index 2: School',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: const Color.fromRGBO(217, 217, 217, 0.34),
        child: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Image.asset('assets/icons/ic_home.png',height: 40.h,width: 40.w,fit: BoxFit.fill,
          ),label: ''),
          BottomNavigationBarItem(icon: Image.asset('assets/icons/ic_community.png',height: 40.h,width: 40.w,fit: BoxFit.fill,),label: ''),
          BottomNavigationBarItem(icon: Image.asset('assets/icons/ic_mufti.png',height: 40.h,width: 40.w,fit: BoxFit.fill,),label: ''),
          BottomNavigationBarItem(icon: Image.asset('assets/icons/ic_message.png',height: 40.h,width: 40.w,fit: BoxFit.fill,),label: ''),
          BottomNavigationBarItem(icon: Image.asset('assets/icons/ic_profile.png',height: 40.h,width: 40.w,fit: BoxFit.fill,),label: '')
        ],
          elevation: 0,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
      body:_widgetOptions.elementAt(_selectedIndex) ,
    );
  }
}
