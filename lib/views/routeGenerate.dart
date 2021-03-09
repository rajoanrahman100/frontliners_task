import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';



const String SplashScreenRoute = "/splashScreen";
const String SignInScreenRoute = "/loginScreen";

class RouteGenerate{


  static Route<dynamic> ErrorRouteScreen() {
    return MaterialPageRoute(builder: (context) {
      return WillPopScope(
        onWillPop: () => helpMeToNavigatePop(context),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Route error"),
          ),
          body: Center(
            child: Text(
              "No view found on that name!",
              style: TextStyle(color: Colors.white, backgroundColor: Colors.red),
            ),
          ),
        ),
      );
    });
  }

  static Future<bool> helpMeToNavigatePop(BuildContext context) async {
    Navigator.pop(context);
    return true;
  }

  static void clearBackStack(BuildContext context, String routeName) {
    Navigator.pushNamedAndRemoveUntil(context, routeName, (r) => false);
  }

  static void navigatePush(BuildContext context, Widget routeName) {
    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftWithFade, child: routeName));
  }
}