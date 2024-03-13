import 'package:ai_assistent/helper/global.dart';
import 'package:ai_assistent/helper/pref.dart';
import 'package:ai_assistent/screens/home_screen.dart';
import 'package:ai_assistent/screens/onboarding_screen.dart';
import 'package:ai_assistent/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // Navigator.of(context).pushReplacement(MaterialPageRoute(
      //     builder: (_) => Pref.showOnboarding
      //         ? const OnboardingScreen()
      //         : const HomeScreen()));

      Get.off(() =>
          Pref.showOnboarding ? const OnboardingScreen() : const HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    //intialize media querry
    mq = MediaQuery.sizeOf(context);
    return const Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
             Spacer(
              flex: 2,
            ),
            // Card(
            //   shape: const RoundedRectangleBorder(
            //       borderRadius: BorderRadius.all(Radius.circular(20))),
            //   child: Padding(
            //     padding: EdgeInsets.all(mq.width * .5),
            //     child: Image.asset(
            //       "assets/images/assistent.avif",
            //      width: mq.width * .4,
            //     ),
            //   ),
            // ),
            // const Spacer(),
           CustomLaoding(),
             Spacer(),
          ],
        ),
      ),
    );
  }
}
