import 'package:ai_assistent/controllers/image_controller.dart';
import 'package:ai_assistent/widgets/custom_btn.dart';
import 'package:ai_assistent/widgets/custom_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ai_assistent/helper/global.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ImageCreatorFeature extends StatefulWidget {
  const ImageCreatorFeature({super.key});

  @override
  State<ImageCreatorFeature> createState() => _ImageCreatorFeatureState();
}

class _ImageCreatorFeatureState extends State<ImageCreatorFeature> {
  final _c = ImageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Image Creator'),
      ),
      body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(
              top: mq.height * 0.02,
              bottom: mq.height * .01,
              left: mq.width * 0.04,
              right: mq.width * 0.04),
          children: [
            Expanded(
              child: TextFormField(
               controller: _c.texc,
                minLines: 2,
                maxLines: null,
                textAlign: TextAlign.center,
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                decoration: const InputDecoration(
                    hintText:
                        "Imagine Something wonderful & Innovative\n I will create it for You ☺ ",
                    hintStyle: TextStyle(fontSize: 13.5),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
            Container(
              height: mq.height * .5,
              alignment: Alignment.center,
              child: Obx(() => _aiImage()),
              
            ),
            CustomButton(onTap: _c.createAIimage, text: 'Create')
          ]),
    );


  }
  
Widget _aiImage() => switch(_c.status.value) {
Status.none => Lottie.asset('assets/lottie/welcome2.json'),
Status.complete => ClipRRect(
  borderRadius: const BorderRadius.all(Radius.circular(10)),
  child: CachedNetworkImage(
          imageUrl: _c.url,
          placeholder: (context, url) => const CustomLaoding(),
          errorWidget: (context, url, error) => const SizedBox(),
       ),
),
     Status.loading => const CustomLaoding()
};
}
