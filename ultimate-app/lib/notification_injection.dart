import 'package:flutter_ultimate/features/feed/domain/usecases/get_user_notification.dart';
import 'package:flutter_ultimate/features/feed/presentation/bloc/notification_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> notificationInjectionInit() async {
  // Bloc
  sl.registerFactory(
    () => NotificationBloc(
      getUserNotifications: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetUserNotification(repository: sl()),
  );
}
