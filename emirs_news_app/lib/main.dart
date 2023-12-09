import 'package:emirs_news_app/viewModels/article_list_view_model.dart';
import 'package:emirs_news_app/views/news_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final theme = ThemeData(useMaterial3: true, primarySwatch: Colors.blueGrey);
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: theme,
    title: 'News',
    home: ChangeNotifierProvider(
      create: (context) => ArticleListViewModel(),
      child: NewsView(),
    ),
  ));
}
