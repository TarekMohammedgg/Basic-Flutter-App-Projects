import 'package:flutter/material.dart';
import 'package:test_emulator_on_vscode/Models/category_card_model.dart';
import 'package:test_emulator_on_vscode/views/category_view.dart';

class Category extends StatelessWidget {
  const Category({super.key, required this.carditem});
  final CategoryModel carditem;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) =>  CategoryView(category: carditem.nameofCard,)));
      },
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
          height: 85,
          width: 140,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(carditem.source)),
              borderRadius: BorderRadius.circular(16)),
          child: Center(
              child: Text(carditem.nameofCard,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold))),
        ),
      ),
    );
  }
}
