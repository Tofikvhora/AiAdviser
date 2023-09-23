import 'package:finenaceadvicer/view/ChatScreen.dart';
import 'package:finenaceadvicer/view/InfomationPage.dart';
import 'package:flutter/material.dart';

import '../view/SplashPage.dart';

class RoutesOfApp {
  static MaterialPageRoute genRoutes(setting) {
    switch (setting.name) {
      case SplashPage.route:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case InfoPage.route:
        return MaterialPageRoute(builder: (_) => const InfoPage());
      case ChatScreen.route:
        return MaterialPageRoute(builder: (_) => const ChatScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                appBar: AppBar(
                    title: const Text(
                      "Error",
                    ),
                    centerTitle: true)));
    }
  }
}
