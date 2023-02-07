import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_provider/models/category_model.dart';
import 'package:news_provider/models/news_models.dart';
import 'package:http/http.dart' as http;

const _BASE_URL = 'https://newsapi.org/v2';
const _API_KEY = 'fbd2271b22f1465d90579a5fc3ff4d1b';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  String _selectedCategory = 'business';

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.futbol, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> newsByCategory = {};

  bool isLoading = false;

  NewsService() {
    getTopHeadlines();

    categories.forEach((element) {
      newsByCategory[element.name] = <Article>[];
    });

    getNewsByCategory(_selectedCategory);
  }

  String get selectedCategory => _selectedCategory;

  set selectedCategory(String value) {
    _selectedCategory = value;
    getNewsByCategory(value);
    notifyListeners();
  }

  List<Article> get getArticlesByCategory => newsByCategory[selectedCategory]!;

  getTopHeadlines() async {
    final url =
        Uri.parse('$_BASE_URL/top-headlines?apiKey=$_API_KEY&country=us');
    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);

    headlines.addAll(newsResponse.articles);

    notifyListeners();
  }

  getNewsByCategory(String category) async {
    if (newsByCategory[category]!.isNotEmpty) {
      return newsByCategory[category];
    }

    isLoading = true;
    notifyListeners();

    final url = Uri.parse(
        '$_BASE_URL/top-headlines?apiKey=$_API_KEY&country=us&category=$category');

    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);

    newsByCategory[category]!.addAll(newsResponse.articles);
    isLoading = false;
    notifyListeners();
  }
}
