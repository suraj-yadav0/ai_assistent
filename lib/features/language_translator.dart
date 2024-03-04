import 'package:ai_assistent/controllers/translator_controlller.dart';
import 'package:ai_assistent/helper/global.dart';
import 'package:ai_assistent/widgets/custom_btn.dart';
import 'package:ai_assistent/widgets/language_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageTranslator extends StatefulWidget {
  const LanguageTranslator({super.key});

  @override
  State<LanguageTranslator> createState() => _LanguageTranslatorState();
}

class _LanguageTranslatorState extends State<LanguageTranslator> {
  final _c = TranslatorController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Language Translator'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          top: mq.height * 0.02,
          bottom: mq.height * .01,
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // from language
              InkWell(
                onTap: () => Get.bottomSheet(LanguageSheet(c: _c, s: _c.from)),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    width: mq.width * .4,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Obx(
                      () => Text(_c.from.isEmpty ? "Auto" : _c.from.value),
                    )),
              ),

              IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.repeat,
                  color: Colors.grey,
                ),
              ),
// TO Button,

             InkWell(
                onTap: () => Get.bottomSheet(LanguageSheet(c: _c, s: _c.to)),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    width: mq.width * .4,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Obx(
                      () => Text(_c.to.isEmpty ? "To" : _c.to.value),
                    )),
              ),
            ],
          ),

          // for input
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mq.width * 0.04, vertical: mq.height * 0.035),
            child: TextFormField(
              controller: _c.texc,
              minLines: 5,
              maxLines: null,
              textAlign: TextAlign.center,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              decoration: const InputDecoration(
                  hintText: "Translate Anything You Want!",
                  hintStyle: TextStyle(fontSize: 13.5),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),

          SizedBox(
            height: mq.height * 0.04,
          ),
          // for output,
          if (_c.resultc.text.isNotEmpty)
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: mq.width * 0.04, vertical: mq.height * 0.035),
              child: TextFormField(
                controller: _c.resultc,
                // minLines: 5,
                maxLines: null,
                textAlign: TextAlign.center,
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),

            CustomButton(onTap: _c.translate, text: 'Translate')
        ],
      ),
    );
  }
}
