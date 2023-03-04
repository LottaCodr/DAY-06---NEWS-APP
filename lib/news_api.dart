import 'package:http/http.dart' as http;
import 'dart:convert';
import 'news_article.dart';

class NewsApi {
  //May include these later on {
  // static const _apiKey;
  //static const _baseUrl; }

  static Future<List<NewsArticle>> fetchNews() async {
    final url = Uri.parse('https://newsdata.io/api/1/news?apikey=pub_182982239da49fbe895a7ae1e569655793a1e&q=NIGERIA ');
    final response = await http.get(url);

 //to check if the request was successful
    if(response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final articles = <NewsArticle>[];
      for (final article in jsonData['articles']) {
        articles.add(NewsArticle(
            author: article['author'],
            title: article['title'],
            description: article['description'],
            content: article['content'],
            url: article['url'],
            urlToImage: article['urlToImage'],
            publishedAt: DateTime.parse(article['publishedAt'])
        ));
      } return articles;
    } else {
      throw  Exception ('failed to load Breaking News');
    }
  }
}