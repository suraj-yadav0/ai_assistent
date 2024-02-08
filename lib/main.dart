import 'package:ai_assistent/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

Future <void> main() async {
WidgetsFlutterBinding.ensureInitialized();

//Hive.defaultDirectory = (await  getApplicationDocumentsDirectory()).path;
await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
