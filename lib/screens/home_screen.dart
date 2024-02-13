import 'package:ai_assistent/helper/global.dart';
import 'package:ai_assistent/helper/pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return const Scaffold(
      body: Center(
        child: Text("Home Screen"),
      ),
    );
  }
}
