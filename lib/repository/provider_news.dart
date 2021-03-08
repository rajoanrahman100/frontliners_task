import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:front_task/model/modelClass.dart';
import 'package:front_task/utils.dart';
import 'package:http/http.dart' as http;

import '../custom_toast.dart';

class ProviderNews extends ChangeNotifier{
  NewsModel newsModel;

  Future<NewsModel> getNewsData()async{
    var res = await http.get(baseUrl);

    print("response code" + res.statusCode.toString());
    print("response news data" + res.body);

    if (res.statusCode == 201 || res.statusCode == 200) {
      var dataMap = jsonDecode(res.body);
      newsModel = NewsModel.fromJson(dataMap);

      notifyListeners();
      return newsModel;
    } else {
      Map<String, dynamic> responseJson = json.decode(res.body);
      print("Error body: "+responseJson["message"]);
      showErrorToast(responseJson["message"]);
    }

  }
}