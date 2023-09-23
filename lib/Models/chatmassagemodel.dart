import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:finenaceadvicer/Provider/chatfunctions.dart';
import 'package:finenaceadvicer/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChatModel extends HookWidget {
  const ChatModel(
      {Key? key, required this.text, required this.sender, required this.isMe})
      : super(key: key);
  final String text;
  final String sender;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<ChatFunctions>(context);
    return isMe
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.84,
                    height: MediaQuery.of(context).size.height * 0.09,
                    child: BubbleNormal(
                      text: text,
                      tail: true,
                      textStyle: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                          letterSpacing: 0.1,
                          textBaseline: TextBaseline.ideographic),
                      color: Colors.deepPurple,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20.w,
                    backgroundImage: isMe
                        ? const AssetImage("asset/images/profile.png")
                        : const AssetImage("asset/images/businessman.png"),
                  ),
                ],
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.h),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: isMe
                      ? const AssetImage("asset/images/profile.png")
                      : const AssetImage("asset/images/businessman.png"),
                  radius: 20.w,
                ),
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                child: BubbleSpecialThree(
                  color: secondaryColor,
                  text: text,
                  tail: false,
                  textStyle: TextStyle(
                      fontSize: 14.sp,
                      letterSpacing: 0.1,
                      color: Colors.white.withOpacity(0.7),
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          );
  }
}
