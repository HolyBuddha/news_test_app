import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_test_app/core/app_colors.dart';
import 'package:news_test_app/domain/model/article.dart';

class ArticleScreen extends StatelessWidget {
  final Article article;
  const ArticleScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: article.imageUrl,
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 20,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      article.title,
                      style:
                          const TextStyle(fontSize: 28, color: AppColors.white),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 16,
                  child: GestureDetector(
                    child: const Icon(CupertinoIcons.back,
                        color: AppColors.white, size: 30),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    article.description ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
