import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ultimate/dependency_indjection.dart';
import 'package:flutter_ultimate/sharedPreferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';

Future<void> main() async {
  // final prefs = await SharedPreferences.getInstance();
  // initPrefManager(prefs);
  runApp(const MyApp());
}
