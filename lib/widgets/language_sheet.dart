import 'package:ai_assistent/controllers/translator_controlller.dart';
import 'package:ai_assistent/helper/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageSheet extends StatefulWidget {
  final TranslatorController c;
  final RxString s;
  const LanguageSheet({super.key, required this.c, required this.s});

  @override
  State<LanguageSheet> createState() => _LanguageSheetState();
}

class _LanguageSheetState extends State<LanguageSheet> {
    final _search = ''.obs;
  @override
  Widget build(BuildContext context) {
  
    return Container(
      height: mq.height * .5,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(mq.width * 0.07),
            child: TextFormField(
              // controller: _c.resultc,
              onChanged: (s) => _search.value = s.toLowerCase(),
              textAlign: TextAlign.center,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.translate_rounded,
                    color: Colors.blue,
                  ),
                  hintText: "Search Languages..",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
          Expanded(child: Obx(
            () {
              final List<String> list = _search.isEmpty
                  ? widget.c.lang
                  : widget.c.lang
                      .where((element) =>
                          element.toLowerCase().contains(_search.value))
                      .toList();
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(
                      top: mq.height * 0.02, left: mq.width * 0.06),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        widget.s.value = list[index];
                        Get.back();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: mq.height * 0.02),
                        child: Text(list[index]),
                      ),
                    );
                  });
            },
          ))
        ],
      ),
    );
  }
}
