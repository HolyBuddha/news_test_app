import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_test_app/domain/model/article.dart';
import 'package:news_test_app/presentation/home/bloc/home_bloc.dart';
import 'package:news_test_app/presentation/home/widgets/featured_news_item.dart';

class FeaturedNewsCarousel extends StatelessWidget {
  const FeaturedNewsCarousel({super.key, required this.featuredArticles});
  final List<Article> featuredArticles;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Text(
          'Featured',
          style: TextStyle(fontSize: 20),
        ),
      ),
      const SizedBox(height: 20),
      Expanded(
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          physics: const PageScrollPhysics(),
          itemBuilder: (_, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: FeaturedNewsItem(featuredArticle: featuredArticles[index]),
            );
          },
          itemCount: featuredArticles.length,
          onPageChanged: (value) =>
              context.read<HomeBloc>().add(HomeChangePage(value)),
        ),
      ),
    ]);
  }
}
