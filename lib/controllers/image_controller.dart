import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {
  final texc = TextEditingController();

  Future<void> askQuestion() async {
    if (texc.text.trim().isNotEmpty) {
      //user data

      texc.text = "";
    }
  }
}
