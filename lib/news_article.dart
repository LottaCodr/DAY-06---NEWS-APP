class NewsArticle {
  final String author;
  final String title;
  final String description;
  final String content;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;

NewsArticle({
  required this.author,
  required this.title,
  required this.description,
  required this.content,
  required this.url,
  required this.urlToImage,
  required this.publishedAt
});
}