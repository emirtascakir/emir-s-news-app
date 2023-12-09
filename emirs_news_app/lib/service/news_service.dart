import 'dart:convert';
import 'dart:io';

import 'package:emirs_news_app/models/articles_model.dart';
import 'package:emirs_news_app/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsService {
  Future<List<Articles>> fetchNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=899a584e74cd4b1a93e32d3b82896acd";
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == HttpStatus.ok) {
      final result = json.decode(response.body);
      News news = News.fromJson(result);
      return news.articles ?? [];
    } else {
      throw Exception("service");
    }
  }
}
