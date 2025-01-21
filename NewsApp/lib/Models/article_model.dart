class ArticleModel {
  final String? newImage;
  final String title;
  final String? subtitle;
  final String? url;
  const ArticleModel(
      {required this.newImage,
      required this.title,
      required this.subtitle,
      this.url});
  factory ArticleModel.fromjson(json) {
    return ArticleModel(
        url: json['url'],
        newImage: json['urlToImage'],
        title: json['title'],
        subtitle: json['description']);
  }
}
