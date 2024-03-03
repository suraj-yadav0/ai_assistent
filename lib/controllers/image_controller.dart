import 'dart:developer';
import 'dart:io';

import 'package:ai_assistent/helper/global.dart';
import 'package:ai_assistent/helper/mydialog.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver_updated/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

enum Status { none, loading, complete }

class ImageController extends GetxController {
  final texc = TextEditingController();

  final status = Status.none.obs;

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

  void downloadImage() async {
    try {
      MyDialog.showLoading();

      final bytes = (await get(Uri.parse(url))).bodyBytes;
      final dir = await getTemporaryDirectory();
      final file = await File('${dir.path}/ai_image.png').writeAsBytes(bytes);

      await GallerySaver.saveImage(file.path , albumName: appName).then((success) {
        Get.back();
        MyDialog.successs("Image Saved to Gallery!");
      });
    } catch (e) {
      Get.back();
      MyDialog.error("Image Cannot be downloade!");
      log('downloadImageError: $e');
    }
  }


    void shareImage() async {
    try {
      MyDialog.showLoading();

      final bytes = (await get(Uri.parse(url))).bodyBytes;
      final dir = await getTemporaryDirectory();
      final file = await File('${dir.path}/ai_image.png').writeAsBytes(bytes);

     Get.back();

   final result = await Share.shareXFiles([XFile(file.path)], text: 'CheckOut this Amazing Image Created by AI ASSISTENT');



    } catch (e) {
      Get.back();
      MyDialog.error("Image Cannot be downloade!");
      log('downloadImageError: $e');
    }
  }
}
