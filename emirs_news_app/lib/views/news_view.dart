import 'package:emirs_news_app/viewModels/article_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ArticleListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latest News'),
        centerTitle: true,
      ),
      body: getWidgetByStatus(vm),
    );
  }

  Widget getWidgetByStatus(ArticleListViewModel vm) {
    switch (vm.status.index) {
      case 2:
        return ListView.builder(
            itemCount: vm.viewModel.articles.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Image.network(vm.viewModel.articles[index].urlToImage ??
                        'https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg'),
                    Text(
                      vm.viewModel.articles[index].title ?? '',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () async {
                              await launchUrl(Uri.parse(
                                  vm.viewModel.articles[index].url ?? ''));
                            },
                            child: const Text("Read More About It"))
                      ],
                    )
                  ],
                ),
              );
            });
      default:
        return const Center(
          child: SpinKitWave(color: Colors.blue),
        );
    }
  }
}
