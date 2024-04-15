import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_test_app/core/app_colors.dart';
import 'package:news_test_app/presentation/home/bloc/home_bloc.dart';
import 'package:news_test_app/presentation/home/widgets/featured_carousel.dart';
import 'package:news_test_app/presentation/home/widgets/news_item.dart';
import 'package:news_test_app/presentation/home/widgets/news_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = context.read<HomeBloc>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainBackground,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'Notifications',
          style: TextStyle(color: AppColors.bodyText, fontSize: 18),
        ),
        elevation: 0,
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              homeBloc.add(HomeMarkAllArticles());
            },
            child: const Text(
              'Mark all read',
              style: TextStyle(color: AppColors.bodyText, fontSize: 18),
            ),
          ),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial) {
            context.read<HomeBloc>().add(HomeInitialing());
          }
          if (state is HomeLoaded) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                    expandedHeight: 300.0,
                    collapsedHeight: 140,
                    floating: true,
                    surfaceTintColor: Colors.transparent,
                    backgroundColor: AppColors.mainBackground,
                    flexibleSpace: LayoutBuilder(
                      builder: (context, constraints) {
                        return AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            child: constraints.biggest.height > 140
                                ? FeaturedNewsCarousel(
                                    featuredArticles: homeBloc.featuredArticles,
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 30),
                                    child: NewsItem(
                                      article: homeBloc.featuredArticles[
                                          homeBloc.featuredArticlesPage],
                                    ),
                                  ));
                      },
                    )),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 10),
                ),
                NewsList(articles: homeBloc.latestArticles)
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
