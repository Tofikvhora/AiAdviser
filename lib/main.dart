import 'package:finenaceadvicer/Provider/StoreDetails.dart';
import 'package:finenaceadvicer/Provider/chatfunctions.dart';
import 'package:finenaceadvicer/routes/routers.dart';
import 'package:finenaceadvicer/utils/Colors.dart';
import 'package:finenaceadvicer/view/SplashPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(350, 680),
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => InfoProvider()),
            ChangeNotifierProvider(create: (context) => ChatFunctions()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RoutesOfApp.genRoutes,
            title: 'Name Of App',
            theme: ThemeData(
              scaffoldBackgroundColor: primaryColor,
              useMaterial3: true,
            ),
            home: const SplashPage(),
          ),
        );
      },
    );
  }
}
