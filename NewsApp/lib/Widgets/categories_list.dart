import 'package:flutter/material.dart';
import 'package:test_emulator_on_vscode/Models/category_card_model.dart';
import 'package:test_emulator_on_vscode/Widgets/category_item_card.dart';


class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key, required this.categoriesList});
  final List<CategoryModel> categoriesList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categoriesList.map((e) => Category(carditem: e)).toList(),
      ),
    );
  }
}
