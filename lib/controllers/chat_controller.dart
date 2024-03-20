import 'package:ai_assistent/api/apis.dart';
import 'package:ai_assistent/helper/mydialog.dart';
import 'package:ai_assistent/model/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final texc = TextEditingController();

  final scrollc = ScrollController();

  final list = <Message>[
    Message(msg: "Hello, How Can I help You ?", msgType: MessageType.bot)
  ].obs;

  Future<void> askQuestion() async {
    if (texc.text.trim().isNotEmpty) {
      //user data
      list.add(Message(msg: texc.text, msgType: MessageType.user));

      list.add(Message(msg: '', msgType: MessageType.bot));
      _scrollDown();



      final res = await APIs.getAnswer(texc.text);
      _scrollDown();

      list.removeLast();

//bot data
      list.add(Message(msg: res, msgType: MessageType.bot));

      texc.text = "";
    }else {
      MyDialog.info('Please Ask Something !');
    }
  }

  void _scrollDown() {
    scrollc.animateTo(scrollc.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }
}
