import 'package:flutter/material.dart';
import 'package:test_emulator_on_vscode/views/news_view.dart';
void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewsView(),
    );
  }
}












