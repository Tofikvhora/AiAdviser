import 'package:flutter/material.dart';

class InfoProvider extends ChangeNotifier {
  String? name;
  String? age;
  String? topic = "Topic";

  void storeInfo(TextEditingController nameUser, TextEditingController ageUser,
      TextEditingController topicUser) {
    name = nameUser.text;
    age = ageUser.text;
    notifyListeners();
  }

  void storeTopic(String value) {
    topic = value;
    notifyListeners();
  }
}
