import 'package:ai_assistent/helper/global.dart';
import 'package:ai_assistent/helper/mydialog.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Status {none,loading , complete}

class ImageController extends GetxController {
  final texc = TextEditingController();

  final status  = Status.none.obs;

  String url = '';

  Future<void> createAIimage() async {
    OpenAI.apiKey = apiKey;
    if (texc.text.trim().isNotEmpty) {
      status.value = Status.loading;
       OpenAIImageModel image = await OpenAI.instance.image.create(
  prompt: texc.text,
  n: 1,
  size: OpenAIImageSize.size512,
  responseFormat: OpenAIImageResponseFormat.url,
);

url = image.data[0].url.toString();

      // texc.text = texc.text;
      status.value = Status.complete;
      MyDialog.successs('Image Created Succefuly');
    } else {
      MyDialog.info('Please Provide some Image Description');
    }
  }
}
