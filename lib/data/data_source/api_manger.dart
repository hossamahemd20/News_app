import 'dart:convert';
import 'dart:developer';

//do the parsing
import 'package:http/http.dart' as http;
import 'package:news_app/models/articles_model.dart';

import '../../models/sources_model.dart';
import '../core/config/constans.dart';

class ApiManger {
  static Future<List<Source>> fetchSourceList(String categoryId) async {
    var url = Uri.https(
      //authority
      Constans.domain, "/v2/top-headlines/sources",
      {
        "apikey": Constans.apiKey,
        "category": categoryId,
      },
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // we got a response from api
      //do the parsing
      Map<String, dynamic> data = jsonDecode(response.body);
      SourcesModel sourcesModel = SourcesModel.fromJson(data);
      return sourcesModel.sources; // here will be change
    } else {
      throw Exception("failed to get source List..");
    }
  }

  // the change is only will be in source
  static Future<List<Article>> fetchArticlesList(String sourceId) async {
    var url = Uri.https(
      //authority
      Constans.domain, "/v2/top-headlines",
      //the name of end point must be change in every parsing of api
      {
        "apikey": Constans.apiKey,
        "sources": sourceId,
      },
    );
    final response = await http.get(url);
    //print(response.body);
    log(response.body.toString());
    if (response.statusCode == 200) {
      // we got a response from api

      Map<String, dynamic> data = jsonDecode(response.body);
      ArticlesModel articleModel = ArticlesModel.fromJson(data);
      return articleModel.articles;
    } else {
      throw Exception("failed to get source List..");
    }
  }
}
