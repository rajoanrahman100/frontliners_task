import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_task/repository/provider_news.dart';
import 'package:front_task/utils.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProviderNews(),
      child: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var providerNewsData = Provider.of<ProviderNews>(context, listen: false);
    providerNewsData.getNewsData();

    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          centerTitle: true,
          leading: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Consumer<ProviderNews>(
            builder: (_, data, child) => data.newsModel== null
                ? Center(child: Text("Loading"))
                    : ListView.builder(
                        itemCount: data.newsModel.articles.length,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
                            child: Container(
                              //height: 120.0,
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
                              ),
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset("assets/title.png",height: 20,width: 20,),
                                      SizedBox(width: 10.0,),
                                      Expanded(
                                        child: Text(
                                          "${data.newsModel.articles[index].title}",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: text_Style(Colors.black,14.0,FontWeight.w500),
                                        ),
                                      ),


                                    ],
                                  ),

                                  Container(
                                    height: 150.0,
                                    width: double.infinity,
                                    child: ClipRRect(borderRadius: BorderRadius.circular(10.0),child: Image.network(data.newsModel.articles[index].urlToImage??"https://picsum.photos/250?image=9",fit: BoxFit.fill,)),
                                  ),

                                ],
                              ),
                            ),
                          );
                        },
                      ),
          ),
        ));
  }
}
