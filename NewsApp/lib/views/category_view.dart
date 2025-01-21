import 'package:flutter/material.dart';
import 'package:test_emulator_on_vscode/Widgets/news_list_view_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(category),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: CustomScrollView(
            slivers: [
              NewsListViewBuilder(category: category),
            ],
          ),
        ));
  }
}
