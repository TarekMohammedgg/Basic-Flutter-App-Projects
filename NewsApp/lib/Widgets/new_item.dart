import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_emulator_on_vscode/Models/article_model.dart';
import 'package:test_emulator_on_vscode/Widgets/web_open_widget.dart';

class NewsItem extends StatelessWidget {
  NewsItem({super.key, required this.articleModel});
  final ArticleModel articleModel;
  final List<String> defaultImages = [
    'assets/general.avif',
    'assets/health.avif',
    'assets/science.avif',
    'assets/sports.avif'
  ];
  final rand = Random();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) =>  WebOpenView(openNew:articleModel ,)));
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(
              imageUrl: articleModel.newImage ??
                  defaultImages[rand.nextInt(defaultImages.length)],
              errorWidget: (context, url, error) {
                // If the image fails to load, return a random image from defaultImages
                return Image.asset(
                  defaultImages[rand.nextInt(defaultImages.length)],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          Text(
            articleModel.title,
            style: const TextStyle(fontSize: 18),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
          ),
          Text(
            articleModel.subtitle ?? " ",
            style: const TextStyle(fontSize: 14),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
