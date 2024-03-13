import 'package:ai_assistent/helper/global.dart';
import 'package:ai_assistent/main.dart';
import 'package:ai_assistent/model/message.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  final Message message;
  const MessageCard({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    const r = Radius.circular(15);
    return message.msgType == MessageType.bot

        // for bot
        ? Row(
            children: [
              const SizedBox(
                width: 6,
              ),
              CircleAvatar(
                radius: 18,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                child: Image.asset(
                  'assets/images/ai.png',
                  width: 24,
                ),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: mq.width * .6),
                margin: EdgeInsets.only(
                    bottom: mq.height * .02, left: mq.width * .02),
                padding: EdgeInsets.symmetric(
                    vertical: mq.height * 0.01, horizontal: mq.width * 0.02),
                decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).lightTextColor),
                    borderRadius: const BorderRadius.only(
                        topLeft: r, bottomRight: r, topRight: r)),
                // child: Text(message.msg),
                child: message.msg.isEmpty ?  AnimatedTextKit(
  animatedTexts: [
    TypewriterAnimatedText(
      'Please Wait...',
      textStyle: const TextStyle(
       // fontSize: 32.0,
        fontWeight: FontWeight.bold,
      ),
      speed: const Duration(milliseconds: 100),
    ),
  ],
  repeatForever: true,
 // totalRepeatCount: 4,
 // pause: const Duration(milliseconds: 1000),
 // displayFullTextOnTap: true,
 // stopPauseOnTap: true,
) : Text(message.msg), 
              ),
            ],

            // for user
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  constraints: BoxConstraints(maxWidth: mq.width * .6),
                  margin: EdgeInsets.only(
                      bottom: mq.height * .02, right: mq.width * .02),
                  padding: EdgeInsets.symmetric(
                      vertical: mq.height * 0.01, horizontal: mq.width * 0.02),
                  decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).lightTextColor),
                      borderRadius: const BorderRadius.only(
                          topLeft: r, topRight: r, bottomLeft: r)),
                  child: Text(message.msg)),
              const CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    color: Colors.blue,
                  )),
              const SizedBox(
                width: 6,
              ),
            ],
          );
  }
}
