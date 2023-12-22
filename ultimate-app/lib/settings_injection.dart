import 'package:flutter_ultimate/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> settingsInjectionInit() async {
  // Bloc
  sl.registerFactory(
    () => NotificationSettingsBloc(),
  );
}
