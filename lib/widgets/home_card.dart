import 'package:ai_assistent/helper/global.dart';
import 'package:ai_assistent/model/home_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;
  const HomeCard({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;
    return InkWell(
      onTap: homeType.onTap,
      child: Card(
        color: Colors.blue.withOpacity(.2),
        child: Row(
          children: [
            Padding(
              padding: homeType.padding,
              child: Lottie.asset(homeType.lottie,
                  width: mq.width * .35),
            ),
            const Spacer(),
           Text(
              homeType.title,
              style: const  TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 1),
            ),
            const Spacer(
              flex: 2,
            )
          ],
        ),
      ).animate().fade(begin: .5,duration: 1.seconds,curve: Curves.easeIn),
    );
  }
}
