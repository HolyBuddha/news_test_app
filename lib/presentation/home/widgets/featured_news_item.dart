import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_test_app/core/app_colors.dart';
import 'package:news_test_app/domain/model/article.dart';

class FeaturedNewsItem extends StatelessWidget {
  final Article featuredArticle;
  const FeaturedNewsItem({super.key, required this.featuredArticle});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            imageUrl: featuredArticle.imageUrl),
      ),
      Positioned(
        bottom: 40,
        left: 20,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Text(
            featuredArticle.title,
            style: const TextStyle(
                color: AppColors.white,
                fontSize: 28,
                fontWeight: FontWeight.w400),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ),
    ]);
  }
}
