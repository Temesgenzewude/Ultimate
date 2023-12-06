import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ultimate/dependency_indjection.dart';
import 'package:flutter_ultimate/feed_injection.dart' as feed_injection;
import 'package:flutter_ultimate/profile_injection.dart' as profile_injection;
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final persistedSharedPrefs = await SharedPreferences.getInstance();
  initPrefManager(prefs);
  initPersistedSharePrefManager(persistedSharedPrefs);
  await profile_injection.profileInjectionInit();
  await feed_injection.feedInjectionInit();

  runApp(const MyApp());
}
