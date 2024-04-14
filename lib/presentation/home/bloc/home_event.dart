part of 'home_bloc.dart';

@immutable
sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class HomeInitialing extends HomeEvent {}

final class HomeChangePage extends HomeEvent {
  final int page;
  const HomeChangePage(this.page);
}

final class HomeMarkArticleById extends HomeEvent {
  final String id;
  const HomeMarkArticleById(this.id);
}

final class HomeMarkAllArticles extends HomeEvent {}
