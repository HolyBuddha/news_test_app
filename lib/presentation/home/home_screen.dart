import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_test_app/common/app_colors.dart';
import 'package:news_test_app/presentation/home/bloc/home_bloc.dart';
import 'package:news_test_app/presentation/home/widgets/news_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();
    return Scaffold(
      appBar: AppBar(
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
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CustomScrollView(
                shrinkWrap: true,
                slivers: [
                  SliverList(
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
                            : IntrinsicHeight(
                                child: NewsItem(
                                    article:
                                        homeBloc.latestArticles[index - 1]),
                              );
                      },
                      childCount: homeBloc.latestArticles.length + 1,
                    ),
                  ),
                ],
              ),
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
