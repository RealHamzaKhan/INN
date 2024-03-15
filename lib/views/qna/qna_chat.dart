import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:inn/services/api_request.dart';
import 'package:inn/views/common_widgets/custom_text.dart';
import 'package:inn/views/common_widgets/spacers.dart';

class QnaChat extends StatefulWidget {
  const QnaChat({Key? key}) : super(key: key);

  @override
  State<QnaChat> createState() => _QnaChatState();
}

class _QnaChatState extends State<QnaChat> {
  List<String> botList = [];
  List<String> userList = [];
  bool textDisabled=false;
  final chatController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  Future<void> sendQuestionAndGetAnswer(String question) async {
    var url = Uri.parse('http://10.0.2.2:5001/ask'); // Adjust the URL as needed
    try {
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'question': question,
        }),
      ).timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        setState(() {
          botList.add(data['answer']);
          textDisabled=false;
        });
      } else {
        setState(() {
          botList.add('Failed to get answer');
          textDisabled=false;
        });
      }
    } catch (e) {
      setState(() {
        botList.add('Error sending question');
        textDisabled=false;
      });
    }
    // Add a small delay to allow the list to build before scrolling
    Future.delayed(Duration(milliseconds: 100), () {
      _scrollToBottom();
    });
    textDisabled=false;
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  bool isConversationStarts = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        heightSpacer(height: 60.h),
        !isConversationStarts
            ? Column(
          children: [
            customText(
                text: "Welcome to your Islamic companion. Ask me anything about Islam, and I'll do my best to provide you with answers and guidance.",
                size: 16.sp,
                fw: FontWeight.w500,
                color: Colors.black.withOpacity(0.52),
                textAlign: TextAlign.center),
          ],
        )
            : Expanded(
          child: ListView.builder(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0.w),
                      child: Container(
                        width: 250.w,
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            customText(text: userList[index]),
                            ],
                        ),
                      ),
                    ),
                    if (index < botList.length) // Check to avoid range error
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8.0.w),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            width: 250.w,
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: Colors.greenAccent,
                            ),
                            child: Column(
                              children: [
                                customText(text: botList[index]),
                                ],
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              }),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    enabled: !textDisabled,
                    maxLines: null,
                    controller: chatController,
                    decoration: InputDecoration(
                      hintText: "Message ...",
                      contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(217, 217, 217, 1)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(217, 217, 217, 0.34)),
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(217, 217, 217, 0.34),
                    ),
                  ),
                ),
                widthSpacer(width: 7.w),
                GestureDetector(
                    onTap: () {
                      if (chatController.text.isNotEmpty) {
                        setState(() {
                          userList.add(chatController.text);
                          isConversationStarts = true;
                          textDisabled=true;
                        });
                        sendQuestionAndGetAnswer(chatController.text);
                        chatController.clear();
                        Future.delayed(Duration(milliseconds: 100), () {
                          _scrollToBottom();
                        });
                      }
                    },
                    child: Icon(Icons.send, color: Colors.greenAccent)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
