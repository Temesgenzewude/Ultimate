import 'package:flutter_ultimate/persisted_shared_pref.dart';
import 'package:flutter_ultimate/sharedPreferences.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Create an instance of GetIt for dependency injection
GetIt sl = GetIt.instance;

// Initialize the PrefManager for managing shared preferences
void initPrefManager(SharedPreferences prefManager) {
  sl.registerLazySingleton<PrefManager>(() => PrefManager(prefManager));
}

// Initialize the PersistedSharePrefManager for managing persisted shared preferences
void initPersistedSharePrefManager(SharedPreferences sharedPreferences) {
  sl.registerLazySingleton<PersistedSharePrefManager>(
      () => PersistedSharePrefManager(sharedPreferences));
}
