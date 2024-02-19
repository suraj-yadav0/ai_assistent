

import 'package:ai_assistent/api/apis.dart';
import 'package:ai_assistent/helper/global.dart';
import 'package:ai_assistent/helper/pref.dart';
import 'package:ai_assistent/model/home_type.dart';
import 'package:ai_assistent/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
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
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            appName,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.blue),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.brightness_4_rounded,
                    color: Colors.blue,
                    size: 26,
                  )),
            )
          ],
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: mq.width * 0.04, vertical: mq.height * 0.015),
          children: HomeType.values.map((e) => HomeCard(homeType: e,)).toList(),
        ).animate().fade(duration: 1.seconds));
  }
}
