import 'package:news_test_app/domain/model/article.dart';

abstract class NewsRepository {
  Future<List<Article>> getLatestArticles();
  Future<List<Article>> getFeaturedArticles();
  Future<Article> getArticle(String id);
}