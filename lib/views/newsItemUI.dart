import 'package:flutter/material.dart';
import 'package:front_task/utils.dart';
import 'package:intl/intl.dart';
import 'package:simple_url_preview/simple_url_preview.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsItemUI extends StatelessWidget {
  String url;
  String title;
  String source;
  String imageUrl;
  String publishAt;
  VoidCallback callback;
  var dateTimeFormat = DateFormat.yMd().add_jm();

  NewsItemUI({this.url,this.title,this.source,this.imageUrl,this.publishAt,this.callback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: GestureDetector(
        onTap: () async {
          await launch(url);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300].withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/title.png",
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Text(
                      "$title",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: text_Style(
                        Colors.black,
                        14.0,
                        FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              SimpleUrlPreview(
                url: url,
                bgColor: Colors.white,
                titleStyle: text_Style(Colors.black, 16.0, FontWeight.w500),
                descriptionStyle: text_Style(Colors.grey, 14.0, FontWeight.w500),
                siteNameStyle: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).primaryColor,
                ),
              ),


              SizedBox(height: 5.0,),
              Text(
                "publish at: ${dateTimeFormat.format(DateTime.parse(publishAt))}",
                style: text_Style(Colors.black, 12.0, FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
