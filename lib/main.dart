import 'package:flutter/material.dart';
import 'package:news_app/news_list_screen.dart';


void main() => runApp(MaterialApp(
  home: const NewsScreen(),
  debugShowCheckedModeBanner:  false,
  theme: ThemeData(
    primarySwatch: Colors.orange,
    visualDensity: VisualDensity.adaptivePlatformDensity
  ),
));

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LNN: Lota News Network'),
        centerTitle: true,
      ),

      body: NewsListScreen(),
    );
  }
}
