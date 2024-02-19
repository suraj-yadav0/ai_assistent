import 'package:ai_assistent/api/apis.dart';
import 'package:ai_assistent/model/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final texc = TextEditingController();

  final list = <Message>[Message(msg: "Hello, How Can I help You ?", msgType: MessageType.bot)].obs;

 Future <void> askQuestion() async {
    if (texc.text.trim().isNotEmpty) {
      //user data
      list.add(Message(msg: texc.text, msgType: MessageType.user));

      list.add(Message(msg: 'Please Wait..', msgType: MessageType.bot));

      final res = await APIs.getAnswer(texc.text);

      list.removeLast();

//bot data
      list.add(Message(msg: res, msgType: MessageType.bot));

      texc.text = "";
    }
  }
}
