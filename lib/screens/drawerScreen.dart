import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:front_task/views/drawerListTile.dart';

import '../utils.dart';

class DrawerClass extends StatelessWidget {
  const DrawerClass({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2, //20.0,
      height: MediaQuery.of(context).size.height,
      child: SafeArea(
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1.7,
                child: Container(
                  padding: EdgeInsets.only(top: 30.0, left: 20.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/sunset.jpg"),
                        fit: BoxFit.cover
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                        child: Image.asset("assets/frontline.png"),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      drawerTextStyle("Jhon Wick", Colors.white,
                          fontSize: 16.0),
                      SizedBox(
                        height: 5.0,
                      ),
                      drawerTextStyle("mrwick@gmail.com", Colors.white,
                          fontSize: 14.0),
                    ],
                  ),
                ),
              ),
              DrawerListTile(icon: Icons.music_note,title: "Music",callback: (){},),
              DrawerListTile(icon: Icons.movie,title: "Movie",callback: (){}),
              DrawerListTile(icon: Icons.shopping_bag,title: "Shopping",callback: (){}),
              DrawerListTile(icon: Icons.apps,title: "Apps",callback: (){}),
              DrawerListTile(icon: Icons.dock_sharp,title: "Docs",callback: (){}),
              DrawerListTile(icon: Icons.settings,title: "Settings",callback: (){}),
              DrawerListTile(icon: Icons.info,title: "About",callback: (){}),
              DrawerListTile(icon: Icons.logout,title: "LogOut",callback: (){}),

            ],
          ),
        ),
      ),
    );
  }
}

