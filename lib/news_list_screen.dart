import 'package:flutter/material.dart';
import 'news_article.dart';
import 'news_api.dart';
import 'news_article_screen.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({Key? key}) : super(key: key);

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
late Future <List<NewsArticle>> _articleFuture;

@override
  void initState() {
    super.initState();
    _articleFuture = NewsApi.fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Headlines'),
        elevation: 0,
      ),

      body: FutureBuilder<List<NewsArticle>>(
        future: _articleFuture,
        builder: (context, snapshot){
          if(snapshot.hasData) {
            final articles = snapshot.data!;
            return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final article = articles[index];
                  return ListTile(
                    leading: article.urlToImage.isNotEmpty?
                    Image.network(article.urlToImage): null,
                    title: Text(article.title),
                    subtitle: Text(article.author),
                    onTap: ()=> Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewsArticleScreen(articleUrl: article.toString()))),
                  );
                });
          } else if (snapshot.hasError){
            return Center(
              child: Text('$snapshot.error'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      ),
    );
  }
}
