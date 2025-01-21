import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_emulator_on_vscode/Models/article_model.dart';
import 'package:test_emulator_on_vscode/Widgets/news_list.dart';
import 'package:test_emulator_on_vscode/services/news_service.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});
  final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsServices(Dio()).getGeneralNews(category_url: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsListView(articles: snapshot.data!);
          } else if (snapshot.hasError) {
            return SliverToBoxAdapter(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Center(child: Text(snapshot.error.toString()))));
          } else {
            return SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
        });
  }
}
