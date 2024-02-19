import 'package:ai_assistent/helper/global.dart';
import 'package:ai_assistent/helper/pref.dart';
import 'package:ai_assistent/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


Future <void> main() async {
WidgetsFlutterBinding.ensureInitialized();


 Pref.initialize();

await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(appBarTheme:  const AppBarTheme(  elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
         iconTheme: IconThemeData(color: Colors.blue),
            titleTextStyle: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.blue),)),
      home: const SplashScreen(),
    );
  }
}
