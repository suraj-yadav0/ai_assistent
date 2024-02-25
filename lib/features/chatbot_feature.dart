import 'package:ai_assistent/controllers/chat_controller.dart';
import 'package:ai_assistent/helper/global.dart';
import 'package:ai_assistent/widgets/message_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatBotFeature extends StatefulWidget {
  const ChatBotFeature({super.key});

  @override
  State<ChatBotFeature> createState() => _ChatBotFeatureState();
}

class _ChatBotFeatureState extends State<ChatBotFeature> {
  final _c = ChatController();
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with AI assistent'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Expanded(
                child: TextFormField(
              controller: _c.texc,
              
              textAlign: TextAlign.center,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              decoration: const InputDecoration(
                  isDense: true,
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Ask me anything !",
                  hintStyle: TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)))),
            )),
            const SizedBox(
              width: 8,
            ),
            CircleAvatar(
              radius: 24,
              child: IconButton(
                onPressed: _c.askQuestion,
                icon: const Icon(
                  Icons.telegram,
                 // color: Colors.white,
                  size: 28,
                ),
              ),
            )
          ],
        ),
      ),
      body: Obx(
        () => ListView(
          controller: _c.scrollc,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(top: mq.height * 0.02, bottom: mq.height * .01),
          children:
              _c.list.map((element) => MessageCard(message: element)).toList(),
        ),
      ),
    );
  }
}
