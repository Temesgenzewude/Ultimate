import 'package:flutter_ultimate/sharedPreferences.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt sl = GetIt.instance;

void initPrefManager(SharedPreferences prefManager) {
  sl.registerLazySingleton<PrefManager>(() => PrefManager(prefManager));
}
