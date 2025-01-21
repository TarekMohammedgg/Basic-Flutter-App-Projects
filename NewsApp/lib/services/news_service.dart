import 'package:dio/dio.dart';
import 'package:test_emulator_on_vscode/Models/article_model.dart';

class NewsServices {
  final Dio dio;
  NewsServices(this.dio);
  Future<List<ArticleModel>> getGeneralNews(
      {required String category_url}) async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      String url =
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=bd2d3977bf42484d896df80abc41b170&category=$category_url";
      final Response response = await dio.get(url);
      final dynamic jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> articleslist = [];
      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromjson(article);
        articleslist.add(articleModel);
      }
      return articleslist;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
