import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_test_app/common/app_colors.dart';
import 'package:news_test_app/domain/model/article.dart';
import 'package:news_test_app/presentation/article/article_screen.dart';
import 'package:news_test_app/presentation/home/bloc/home_bloc.dart';

class NewsItem extends StatelessWidget {
  final Article article;
  const NewsItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: article.readed ? AppColors.gray : AppColors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 20.0,
              spreadRadius: 0.0,
              offset: Offset(4, 4),
            ),
            BoxShadow(
              color: Color.fromRGBO(255, 255, 255, 1),
              blurRadius: 8.0,
              spreadRadius: 0.0,
              offset: Offset(-4, -4),
            ),
          ],
          borderRadius: BorderRadius.circular(9),
        ),
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding:
            const EdgeInsets.only(left: 20, right: 35, top: 20, bottom: 20),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: article.imageUrl,
                height: 60,
                width: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 16, color: AppColors.bodyText),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    article.publicationDate.toString(),
                    style: const TextStyle(
                        fontSize: 12, color: AppColors.secondaryText),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      onTap: () {
        context.read<HomeBloc>().add(HomeMarkArticleById(article.id));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleScreen(article: article),
          ),
        );
      },
    );
  }
}
