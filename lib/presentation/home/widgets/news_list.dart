import 'package:flutter/material.dart';
import 'package:news_test_app/core/app_colors.dart';
import 'package:news_test_app/domain/model/article.dart';
import 'package:news_test_app/presentation/home/widgets/news_item.dart';

class NewsList extends StatelessWidget {
  final List<Article> articles;
  const NewsList({super.key, required this.articles});

  @override
  Widget build(Object context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, int index) {
            return index == 0
                ? const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Latest news',
                      style: TextStyle(
                          color: AppColors.bodyText,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                : NewsItem(article: articles[index - 1]);
          },
          childCount: articles.length + 1,
        ),
      ),
    );
  }
}
