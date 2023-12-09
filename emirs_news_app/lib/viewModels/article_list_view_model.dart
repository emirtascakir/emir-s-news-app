import 'package:emirs_news_app/service/news_service.dart';
import 'package:emirs_news_app/viewModels/article_view_model.dart';
import 'package:flutter/material.dart';

enum Status { initial, loading, loaded }

class ArticleListViewModel extends ChangeNotifier {
  ArticleViewModel viewModel = ArticleViewModel('general', []);
  Status status = Status.initial;

  ArticleListViewModel() {
    getNews();
  }

  Future<void> getNews() async {
    status = Status.loading;
    notifyListeners();
    viewModel.articles = await NewsService().fetchNews(viewModel.category);
    status = Status.loaded;
    notifyListeners();
  }
}
