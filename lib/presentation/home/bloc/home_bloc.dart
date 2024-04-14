import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:news_test_app/domain/model/article.dart';
import 'package:news_test_app/domain/repository/news_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final NewsRepository repository;
  List<Article> featuredArticles = [];
  List<Article> latestArticles = [];
  int page = 0;

  HomeBloc(this.repository) : super(HomeInitial()) {
    on<HomeInitialing>((event, emit) async {
      featuredArticles = await repository.getFeaturedArticles();
      latestArticles = await repository.getLatestArticles();
      emit(HomeLoaded());
    });
    on<HomeMarkArticleById>((event, emit) {
      List<Article> newArticles = [];
      for (var article in latestArticles) {
        if (article.id == event.id) {
          newArticles.add(article.copyWith(readed: true));
        } else {
          newArticles.add(article);
        }
      }
      latestArticles = newArticles;
      emit(HomeLoading());
      emit(HomeLoaded());
    });
    on<HomeMarkAllArticles>((event, emit) {
      List<Article> readedArticles = [];
      for (var article in latestArticles) {
        readedArticles.add(article.copyWith(readed: true));
      }
      latestArticles = readedArticles;
      emit(HomeLoading());
      emit(HomeLoaded());
    });
  }
}
