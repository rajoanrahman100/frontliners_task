import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:front_task/screens/drawerScreen.dart';
import 'package:front_task/utils.dart';
import 'package:front_task/views/homeContainerUI.dart';
import 'package:front_task/views/routeGenerate.dart';

import 'newsShowScreen.dart';

class MyHomePage extends StatelessWidget {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: lightBlue,
        title: Text("Headline"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            AspectRatio(
                aspectRatio: 1.5,
                child: Center(
                  child: Image.asset(
                    "assets/frontline.png",
                    height: 160,
                  ),
                )),
            Container(
              height: MediaQuery.of(context).size.height/2,
              margin: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      HomePageContainer(icon: Icons.history,title: "Fedd Updates",),
                      SizedBox(width: 15.0,),
                      HomePageContainer(icon: Icons.search,title: "Search Jobs",),
                    ],
                  ),

                  SizedBox(height: 25.0,),

                  Row(
                    children: [
                      HomePageContainer(icon: Icons.security,title: "My Safety",),
                      SizedBox(width: 15.0,),
                      HomePageContainer(icon: Icons.feedback,title: "My News",callback: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NewsDataScreen()),
                        );
                      },),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      drawer: DrawerClass(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(2.0),
        child: FloatingActionButton(
          child: Icon(Icons.notifications,color: Colors.white,),
          backgroundColor: lightBlue,
        ),
      ),
    );
  }
}

