import 'package:flutter_ultimate/features/profiles/data/datasources/subscription_remote_datasource.dart';
import 'package:flutter_ultimate/features/profiles/data/repositories/subscription_repository_impl.dart';
import 'package:flutter_ultimate/features/profiles/domain/repositories/subscription_repository.dart';
import 'package:flutter_ultimate/features/profiles/domain/usecases/subscribe_to_user_b.dart';
import 'package:flutter_ultimate/features/profiles/presentation/bloc/subscription_bloc/bloc/subscription_bloc_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> subscriptionInjectionInit() async {
  // Bloc
  sl.registerFactory(
    () => SubscriptionBloc(
      subscribeToUserB: sl(),
    ),
  );

  // usecases
  sl.registerLazySingleton(
    () => SubscribeToUserB(repository: sl()),
  );

  // Repository
  sl.registerLazySingleton<SubscriptionRepository>(
    () => SubscriptionRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data Sources
  sl.registerLazySingleton<SubscriptionRemoteDataSource>(
    () => SubscriptionRemoteDataSourceImpl(client: sl()),
  );
}
