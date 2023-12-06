import 'package:flutter_ultimate/core/network/network_info.dart';
import 'package:flutter_ultimate/features/feed/data/datasources/feed_remote_datasource.dart';
import 'package:flutter_ultimate/features/feed/data/repositories/feed_repo_impl.dart';
import 'package:flutter_ultimate/features/feed/domain/repositories/news_repository.dart';
import 'package:flutter_ultimate/features/feed/domain/usecases/get_all_news.dart';
import 'package:flutter_ultimate/features/feed/domain/usecases/get_news.dart';
import 'package:flutter_ultimate/features/feed/presentation/bloc/feed_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;
Future<void> feedInjectionInit() async {
  // Bloc
  sl.registerFactory(
    () => FeedBloc(
      getAllNews: sl(),
      getNews: sl(),
    ),
  );

  // usecases
  sl.registerLazySingleton(
    () => GetAllNews(repository: sl()),
  );

  sl.registerLazySingleton(
    () => GetNews(repository: sl()),
  );

  // Repository
  sl.registerLazySingleton<FeedRepository>(
    () => FeedRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data Sources
  sl.registerLazySingleton<FeedRemoteDataSource>(
    () => FeedRemoteDataSourceImpl(client: sl()),
  );

  //core
  // sl.registerLazySingleton<NetworkInfo>(
  //   () => NetworkInfoImpl(sl()),
  // );

  //external
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => http.Client());
  // sl.registerLazySingleton(() => InternetConnectionChecker());
}
