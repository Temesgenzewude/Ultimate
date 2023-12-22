import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/admin_notification_injection.dart'
    as admin_notification_injection;
import 'package:flutter_ultimate/bloc_observer.dart';
import 'package:flutter_ultimate/dependency_indjection.dart';
import 'package:flutter_ultimate/feed_injection.dart' as feed_injection;
import 'package:flutter_ultimate/notification_injection.dart'
    as notification_injection;
import 'package:flutter_ultimate/profile_injection.dart' as profile_injection;
import 'package:flutter_ultimate/settings_injection.dart' as settings_injection;
import 'package:flutter_ultimate/subscription_injection.dart'
    as subscription_injection;
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';

//TODO: THIS IS THE LATESTE CODE WORKING FINE FOR BOTH USER A AND USER B
//TODO: CHECK THIS LINE TO CONFIRM THAT THE CODE IS THE LATEST ONE

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final persistedSharedPrefs = await SharedPreferences.getInstance();
  initPrefManager(prefs);
  initPersistedSharePrefManager(persistedSharedPrefs);
  await profile_injection.profileInjectionInit();
  await feed_injection.feedInjectionInit();
  await notification_injection.notificationInjectionInit();
  await admin_notification_injection.adminNotificationInjectionInit();
  await subscription_injection.subscriptionInjectionInit();
  await settings_injection.settingsInjectionInit();

  Bloc.observer = SimpleBlocObserver();

  runApp(const MyApp());
}
