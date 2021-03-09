import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_task/utils.dart';

class HomePageContainer extends StatelessWidget {

  IconData icon;
  String title;
  VoidCallback callback;

  HomePageContainer({this.icon,this.title,this.callback});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: callback,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          child: Container(
            height: 120.0,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300].withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(10.0)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon,size: 30.0,color: Colors.lightBlue[200],),
                SizedBox(height: 10.0,),
                Text(title,style: text_Style(lightBlue, 16.0, FontWeight.w500),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
