import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:front_task/screens/homeScreen.dart';
import 'package:front_task/utils.dart';

import 'authScreen/phoneAuthScreen.dart';
import 'newsShowScreen.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(milliseconds: 2000), () {
      FirebaseAuth.instance.authStateChanges().listen((User user) {
        if (user == null) {
          Navigator.of(context).pushNamedAndRemoveUntil('/phoneAuth', (Route<dynamic> route) => false);
        } else {
          print('User is signed in!');
          Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);

        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
              Center(child: Image.asset("assets/frontline.png",height: 150,),),
              SizedBox(height: 50,),
              Text(
                "A super app for doctor",
                style: text_Style(Colors.black, 20.0, FontWeight.w500),
              ),
              Spacer(),
              CircularProgressIndicator(),
              Spacer(),

            ],
          ),
        ),
      ),
    );
  }
}
