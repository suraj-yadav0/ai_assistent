import 'package:ai_assistent/helper/global.dart';
import 'package:ai_assistent/model/onboard.dart';
import 'package:ai_assistent/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final c = PageController();
    final list = [
      //onboarding 1
      Onboard(
          title: 'Ask me Anything',
          subtitle:
              'I can be your Best Friend & You can ask me anything & I will help',
          lottie: 'welcome1'),

          //onboarding 2,
            Onboard(
          title: 'Imagination to Reality',
          subtitle:
              'Just imagine anything & I will create something wonderful for you',
          lottie: 'welcome2'),

    ];
    return Scaffold(
      body: PageView.builder(
        controller: c,
        itemCount: list.length,
        itemBuilder: ((context, index) {
          final isLast =  index == list.length -1;
        return SingleChildScrollView(
          child: Column(
          children: [
            //lottie,
            Lottie.asset('assets/lottie/${list[index].lottie}.json', height: mq.height * .6),
          
            // title,
          
             Text(
              list[index].title,
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: .5),
            ),
            SizedBox(
              height: mq.height * .015,
            ),
            //subtitle,
            SizedBox(
              width: mq.width * .7,
              child:  Text(
                list[index].subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 13.5, letterSpacing: .5),
              ),
            ),
          
            const Spacer(),
          
            // dots,
          
            Wrap(
              spacing: 10,
              children: List.generate(
                list.length,
                (i) => Container(
                  width: i == index ? 15 : 10,
                  height: 8,
                  decoration:  BoxDecoration(
                      color: i == index ? Colors.blue : Colors.grey,
                      borderRadius: const BorderRadius.all(Radius.circular(7))),
                ),
              ),
            ),
          
            const Spacer(),
            //button,
          
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  elevation: 0,
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  minimumSize: Size(mq.width * .4, 50)),
              onPressed: () {
                if(isLast) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));
                }else {
                  c.nextPage(duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
                }
              },
              child: Text( isLast ? 'Finish' : 'Next'),
            ),
          
            const Spacer(
              flex: 2,
            )
          ],
                ),
        );
      }))
    );
  }
}
