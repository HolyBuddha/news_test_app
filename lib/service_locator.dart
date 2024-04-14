import 'package:get_it/get_it.dart';
import 'package:news_test_app/data/repositories/mock_news_repository.dart';
import 'package:news_test_app/domain/repository/news_repository.dart';
import 'package:news_test_app/presentation/home/bloc/home_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  sl.registerFactory(() => HomeBloc(sl()));

  //Repositories
  sl.registerLazySingleton<NewsRepository>(() => MockNewsRepository());
}