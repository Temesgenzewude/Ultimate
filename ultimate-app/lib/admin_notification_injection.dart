import 'package:flutter_ultimate/features/feed/domain/usecases/get_admin_notification.dart';
import 'package:flutter_ultimate/features/feed/presentation/bloc/admin_notification_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> adminNotificationInjectionInit() async {
  // Bloc
  sl.registerFactory(
    () => AdminNotificationBloc(
      getAdminNotifications: sl(),
    ),
  );

  sl.registerFactory(
    () => GetAdminNotification(
      repository: sl(),
    ),
  );
}
