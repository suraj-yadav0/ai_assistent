import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLaoding extends StatelessWidget {
  const CustomLaoding({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/lottie/loading.json',width:100);
  }
}