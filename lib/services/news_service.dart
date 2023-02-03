import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_provider/models/news_models.dart';
import 'package:http/http.dart' as http;

final _BASE_URL = 'https://newsapi.org/v2';
final _API_KEY = 'fbd2271b22f1465d90579a5fc3ff4d1b';

class NewsService with ChangeNotifier {

  List<Article> headlines = [];

  NewsService(){
    getTopHeadlines();
  }

  getTopHeadlines() async {
    // final url = Uri.parse('$_BASE_URL/top-headlines?apiKey=$_API_KEY&country=us');
    // final resp = await http.get(url);

    // final news = json.decode(resp.body);

    // final art = news['articles'];

    // final newsResponse = newsResponseFromJson(resp.body);

    // headlines.addAll(newsResponse.articles);

    final String response = await rootBundle.loadString('news.json');
    final newsResponse = newsResponseFromJson(response);
    headlines.addAll(newsResponse.articles);
    notifyListeners();

  }
}