import 'dart:convert';

import 'package:backstone_task/models/article.dart';
import 'package:backstone_task/models/response-error.dart';
import 'package:backstone_task/utils/constants.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Api {
  Future getArticles() async {
    try {
      List<Article> articles = [];
      String responseBody = await getServices(
          'mostviewed/all-sections/7.json?api-key=Fj5wkgywEJ4aDB6clvRc61vCqZSt2gq7');
      Iterable list = json.decode(responseBody)['results'];
      articles = list.map((article) => Article.fromJson(article)).toList();
      print("articles are :$articles");
      return articles;
    } catch (e) {
      throw e;
    }
  }

  static Future getServices(String url) async {
    print('get url  is :${Constants.baseUrl}$url');
    try {
      String accessToken = "";
      print("my token :$accessToken");
      Response response = await http.get('${Constants.baseUrl}$url', headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': accessToken != null ? 'Bearer $accessToken' : null
      }).timeout(Duration(seconds: 60));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        var responseJson = json.decode(response.body);
        print("error stack is:$responseJson");
        ResponseError error = ResponseError.fromJson(responseJson);
        print(error.errors);
        throw Exception(error);
      }
    } catch (err) {
      print('catch get error is :$err');
      throw err;
    }
  }
}
