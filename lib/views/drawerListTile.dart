import 'package:flutter/material.dart';
import 'package:front_task/utils.dart';

class DrawerListTile extends StatelessWidget {

  IconData icon;
  String title;
  VoidCallback callback;

  DrawerListTile({this.icon,this.title,this.callback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: colorBlack,
      ),
      title: drawerTextStyle(title, colorBlack),
      onTap: callback,
    );
  }
}
