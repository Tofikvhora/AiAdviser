import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:finenaceadvicer/Models/Prompt.dart';
import 'package:finenaceadvicer/Models/chatmassagemodel.dart';
import 'package:finenaceadvicer/common/ApiKey.dart';
import 'package:flutter/widgets.dart';

import '../common/chatcontroller.dart';

class ChatFunctions extends ChangeNotifier {
  // ChatGpt Logic function and ChatGpt API
  bool isTyping = false;
  void sendMassage() async {
    ChatModel massages = ChatModel(
      text: chatController.text,
      sender: "user",
      isMe: true,
    );
    massage.insert(0, massages);
    String responseGpt = await getDataFromGpt(chatController.text);
    ChatModel chatGpt = ChatModel(
      text: responseGpt,
      sender: "Gpt",
      isMe: false,
    );
    massage.insert(0, chatGpt);
    isTyping = false;
    chatController.clear();
    notifyListeners();
  }

  Future<String> getDataFromGpt(String massage) async {
    String uri = "https://api.openai.com/v1/chat/completions";
    Map<String, dynamic> body = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {
          "role": "user",
          "content":
              // add prompt
              PromptOfApp.myPrompt + massage
        }
      ],
      "max_tokens": 200,
    };

    final response = await Dio().post(
      uri,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${ApiKey.apikey}"
        },
      ),
      data: json.encode(body),
    );
    Map getReponse = response.data;
    String reply = getReponse["choices"][0]["message"]["content"];
    return reply;
  }
}
