import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsArticleScreen extends StatelessWidget {
  final String articleUrl;

  const NewsArticleScreen({super.key, required this.articleUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Article'),
      ),

      body: WebView(
        initialUrl: articleUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
