import 'package:flutter/material.dart';
import 'package:test_emulator_on_vscode/Models/category_card_model.dart';
import 'package:test_emulator_on_vscode/Widgets/categories_list.dart';
import 'package:test_emulator_on_vscode/Widgets/customize_appbar.dart';
import 'package:test_emulator_on_vscode/Widgets/news_list_view_builder.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});
  final List<CategoryModel> news = const [
    CategoryModel(
        source: "assets/entertaiment.avif", nameofCard: "entertainment"),
    CategoryModel(source: "assets/technology.jpeg", nameofCard: "technology"),
    CategoryModel(source: "assets/health.avif", nameofCard: "health"),
    CategoryModel(source: "assets/science.avif", nameofCard: "science"),
    CategoryModel(source: 'assets/sports.avif', nameofCard: 'sports'),
    CategoryModel(source: 'assets/business.avif', nameofCard: 'business')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const NewsView()));
              },
              child: const CustomizeAppBAr())),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CategoriesListView(
                categoriesList: news,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            const NewsListViewBuilder(
              category: 'general',
            ),
          ],
        ),
      ),
    );
  }
}
