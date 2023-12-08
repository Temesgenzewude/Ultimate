import 'package:flutter_ultimate/core/network/network_info.dart';
import 'package:flutter_ultimate/features/profiles/data/datasources/profile_remote_data_source.dart';
import 'package:flutter_ultimate/features/profiles/data/repositories/profile_repo_impl.dart';
import 'package:flutter_ultimate/features/profiles/domain/repositories/profile_repository.dart';
import 'package:flutter_ultimate/features/profiles/domain/usecases/getUserB.dart';
import 'package:flutter_ultimate/features/profiles/domain/usecases/getUserBProfiles.dart';
import 'package:flutter_ultimate/features/profiles/presentation/bloc/profile_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;
Future<void> profileInjectionInit() async {
  // Bloc
  sl.registerFactory(
    () => ProfileBloc(
      getUserBProfile: sl(),
      getUserBProfiles: sl(),
    ),
  );

  // usecases
  sl.registerLazySingleton(
    () => GetUserBProfile(repository: sl()),
  );

  sl.registerLazySingleton(
    () => GetUserBProfiles(repository: sl()),
  );

  // Repository
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data Sources
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(client: sl()),
  );

  //core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );

  //external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
