import 'package:finenaceadvicer/utils/Colors.dart';
import 'package:finenaceadvicer/utils/StringNavigation.dart';
import 'package:finenaceadvicer/view/InfomationPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends HookWidget {
  static const String route = "SplashPage";
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Future.delayed(const Duration(seconds: 3), () {
        InfoPage.route.pushAndReplace(context);
      });
      return (){};
    }, []);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "asset/images/splash.png",
              fit: BoxFit.contain,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: Text(
                "Your Financial Advisor",
                style: TextStyle(fontSize: 20.sp, color: textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
