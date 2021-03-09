import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_task/repository/provider_news.dart';
import 'package:front_task/views/newsItemUI.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NewsDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProviderNews(),
      child: NewsScreen(),
    );
  }
}

class NewsScreen extends StatelessWidget {
  var dateTimeFormat = DateFormat.yMd();

  @override
  Widget build(BuildContext context) {
    var providerNewsData = Provider.of<ProviderNews>(context, listen: false);
    providerNewsData.getNewsData();

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.cyan,
        title: Text("Headline"),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Consumer<ProviderNews>(
          builder: (_, data, child) => data.newsModel == null
              ? Center(child: Image.asset("assets/spinner.gif",height: 70,))
              : ListView.builder(
                  itemCount: data.newsModel.articles.length,
                  itemBuilder: (_, index) {
                    return NewsItemUI(
                      url: data.newsModel.articles[index].url,
                      title: data.newsModel.articles[index].title,
                      source: data.newsModel.articles[index].source.name,
                      imageUrl: data.newsModel.articles[index].urlToImage,
                      publishAt: data.newsModel.articles[index].publishedAt,
                    );
                  },
                ),
        ),
      ),
    );
  }
}

