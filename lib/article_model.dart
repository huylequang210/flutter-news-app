import 'dart:convert';
import 'package:http/http.dart' as http;

class ArticleModel {
  late String author;
  late String title;
  late String description;
  late String url;
  late String urlToImage;
  late String content;

  ArticleModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
  });
}

Future<List<ArticleModel>> loadArticles() async {
  String uri = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=ba0060cc88f8491ea0395af80e55e2e4';
  var dataFromURL = await http.get(Uri.parse(uri));
  var jsonData = json.decode(dataFromURL.body);
  jsonData = jsonData['articles'];

  List<ArticleModel> listArticleModel = <ArticleModel>[];
  jsonData.forEach((data) {
    ArticleModel model = ArticleModel(
      author: data['author'] ?? '',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      url: data['url'] ?? '',
      urlToImage: data['urlToImage'] ?? '',
      content: data['image'] ?? '',
    );
    listArticleModel.add(model);

  });
  return listArticleModel;
}