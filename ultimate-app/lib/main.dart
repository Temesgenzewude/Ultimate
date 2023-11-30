import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ultimate/dependency_indjection.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final persistedSharedPrefs = await SharedPreferences.getInstance();
  initPrefManager(prefs);
  initPersistedSharePrefManager(persistedSharedPrefs);

  runApp(const MyApp());
}
