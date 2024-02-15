import 'package:flutter/material.dart';

enum HomeType { aiChatBot, aiImage, aiTranslator }

extension MyHomeType on HomeType {

  // for title
  String get title => switch (this) {
    HomeType.aiChatBot => 'AI ChatBot',
     HomeType.aiImage => 'AI Image Creator',
      HomeType.aiTranslator => 'Language Translator',
  };

  String get lottie => switch (this) {
    HomeType.aiChatBot => 'assets/lottie/ai_hand_wave.json',
     HomeType.aiImage => 'assets/lottie/welcome1.json',
      HomeType.aiTranslator => 'assets/lottie/welcome2.json',
  };

  EdgeInsets get padding => switch(this) {
    HomeType.aiChatBot => EdgeInsets.zero,
     HomeType.aiImage => const EdgeInsets.all(10),
      HomeType.aiTranslator => EdgeInsets.zero
  };
}
