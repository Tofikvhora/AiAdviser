import 'package:finenaceadvicer/Provider/StoreDetails.dart';
import 'package:finenaceadvicer/utils/Colors.dart';
import 'package:finenaceadvicer/utils/StringNavigation.dart';
import 'package:finenaceadvicer/view/ChatScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class InfoPage extends HookWidget {
  static const String route = "InfoPage";
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameTextCon = useTextEditingController();
    final ageTextCon = useTextEditingController();
    final topicTextCon = useTextEditingController();
    final dropValue = useState<String>("Topic");
    final notifier = Provider.of<InfoProvider>(context);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 0),
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.65,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                color: secondaryColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  child: Center(
                    child: Text(
                      "Give Some Information",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: textColor,
                          letterSpacing: 2.w,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                // name
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                  child: Text(
                    "Your Name",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: textColor,
                        letterSpacing: 2.w,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                  child: TextField(
                    controller: nameTextCon,
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: textColor,
                        letterSpacing: 2.w,
                        fontWeight: FontWeight.bold),
                    maxLength: 15,
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: "Name",
                      hintStyle: TextStyle(
                          fontSize: 15.sp,
                          color: textColor,
                          letterSpacing: 2.w,
                          fontWeight: FontWeight.w300),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: primaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: textColor)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.redAccent)),
                    ),
                  ),
                ),
                // age
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                  child: Text(
                    "Your Age",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: textColor,
                        letterSpacing: 2.w,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                  child: TextField(
                    controller: ageTextCon,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: textColor,
                        letterSpacing: 2.w,
                        fontWeight: FontWeight.bold),
                    maxLength: 3,
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: "Age",
                      hintStyle: TextStyle(
                          fontSize: 15.sp,
                          color: textColor,
                          letterSpacing: 2.w,
                          fontWeight: FontWeight.w300),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: primaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: textColor)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.redAccent)),
                    ),
                  ),
                ),
                // topic
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                  child: Text(
                    "Your Topic",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: textColor,
                        letterSpacing: 2.w,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.w),
                  height: 40.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: primaryColor),
                      color: textColor),
                  child: DropdownButton<String>(
                    borderRadius: BorderRadius.circular(15),
                    elevation: 5,
                    hint: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(
                        notifier.topic.toString(),
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: primaryColor,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    icon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Icon(
                        IconlyLight.arrow_down_2,
                        size: 20.w,
                      ),
                    ),
                    dropdownColor: textColor,
                    isExpanded: true,
                    items: <String>[
                      'Business',
                      'how to earn money online',
                      'investment',
                      "Saving Money",
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: primaryColor,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 2.w),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      notifier.storeTopic(value.toString());
                      print(notifier.topic);
                    },
                  ),
                ),
                SizedBox(height: 10.h),
                InkWell(
                  onTap: nameTextCon.text.isEmpty ||
                          ageTextCon.text.isEmpty ||
                          notifier.topic == "Topic"
                      ? () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: secondaryColor,
                              content: Text("Fill Fields*",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: textColor,
                                      letterSpacing: 2.w,
                                      fontWeight: FontWeight.bold))));
                        }
                      : () {
                          notifier.storeInfo(
                              nameTextCon, ageTextCon, topicTextCon);
                          ChatScreen.route.pushOnThis(context);
                        },
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: primaryColor),
                    child: Text(
                      "Submit Information",
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: textColor,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.w),
                    ),
                  ),
                )
              ],
            ),
          ),
          Image.asset("asset/images/splash.png")
        ],
      ),
    );
  }
}
