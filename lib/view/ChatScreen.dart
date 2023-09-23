import 'package:finenaceadvicer/common/chatcontroller.dart';
import 'package:finenaceadvicer/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../Provider/chatfunctions.dart';

class ChatScreen extends HookWidget {
  static const String route = "ChatScreen";
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<ChatFunctions>(context);
    final isTyping = useState<bool>(false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 5,
        centerTitle: true,
        leadingWidth: 50.w,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          child: const CircleAvatar(
            backgroundColor: textColor,
            backgroundImage: AssetImage("asset/images/businessman.png"),
          ),
        ),
        title: Text(
          "Your Advisor",
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: 15.sp,
              color: textColor,
              fontWeight: FontWeight.w600,
              letterSpacing: 2.w),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            reverse: true,
            itemCount: massage.length,
            itemBuilder: (context, index) {
              return massage[index];
            },
          )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: TextField(
              textInputAction: TextInputAction.send,
              autocorrect: true,
              keyboardType: TextInputType.text,
              controller: chatController,
              onSubmitted: (value) {
                if (chatController.text.isNotEmpty) {
                  notifier.sendMassage();
                  notifier.isTyping = true;
                  FocusScope.of(context).unfocus();
                  chatController.clear();
                } else {
                  throw "write something";
                }
              },
              style: TextStyle(
                  fontSize: 15.sp,
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.w),
              decoration: InputDecoration(
                  hintText: "Ask Anything",
                  suffixIcon: IconButton(
                    icon: Icon(IconlyLight.send, size: 20.w, color: textColor),
                    onPressed: () {
                      if (chatController.text.isNotEmpty) {
                        notifier.sendMassage();
                        isTyping.value = true;
                        FocusScope.of(context).unfocus();
                        chatController.clear();
                      } else {
                        throw "write something";
                      }
                    },
                  ),
                  hintStyle: TextStyle(
                      fontSize: 15.sp,
                      color: textColor,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 2.w),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: primaryColor)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: primaryColor)),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.5)),
            ),
          )
        ],
      ),
    );
  }
}
