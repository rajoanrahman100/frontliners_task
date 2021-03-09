import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:front_task/screens/authScreen/phoneAuthScreen.dart';
import 'package:front_task/screens/homeScreen.dart';
import 'package:front_task/screens/newsShowScreen.dart';
import 'package:front_task/screens/splashScreen.dart';
import 'package:front_task/screens/webScreen.dart';
import 'package:front_task/utils.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreenPage(),
        '/home': (context) => MyHomePage(),
        '/phoneAuth': (context) => EnterMobileNumberScreen(),
        '/webView': (context) => WebViewExample(),
      },
      home: SplashScreenPage(),
    );
  }
}


