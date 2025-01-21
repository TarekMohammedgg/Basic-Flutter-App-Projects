import 'package:flutter/material.dart';
import 'package:test_emulator_on_vscode/Models/article_model.dart';
import 'package:test_emulator_on_vscode/Widgets/new_item.dart';


class NewsListView extends StatelessWidget {
  final List<ArticleModel> articles;

  const NewsListView({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: articles.length,
            (context, index) => NewsItem(
                  articleModel: articles[index],
                )));
  }
}
