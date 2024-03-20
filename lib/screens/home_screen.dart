import 'dart:ffi';

import 'package:ai_assistent/helper/global.dart';
import 'package:ai_assistent/helper/pref.dart';
import 'package:ai_assistent/model/home_type.dart';
import 'package:ai_assistent/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _isDarMode = Pref.isDarkMode.obs;
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Pref.showOnboarding = false;
  }

  @override
  Widget build(BuildContext context) {
    //initalize media querry
    mq = MediaQuery.sizeOf(context);

    //  APIs.getAnswer('Hi');

    Animate.restartOnHotReload = true;
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.white,
          title: const Text(
            appName,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {
                    Get.changeThemeMode(
                        _isDarMode.value ? ThemeMode.light : ThemeMode.dark);

                    _isDarMode.value = !_isDarMode.value;
                      Pref.isDarkMode = _isDarMode.value;
                  },
                  icon:  Obx(
                    () => Icon(
                      _isDarMode.value ? Icons.brightness_2_rounded :
                      Icons.brightness_5_rounded,
                      size: 26,
                    ),
                  )),
            )
          ],
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: mq.width * 0.04, vertical: mq.height * 0.015),
          children: HomeType.values
              .map((e) => HomeCard(
                    homeType: e,
                  ))
              .toList(),
        ).animate().fade(duration: NumDurationExtensions(1).seconds));
  }
}
