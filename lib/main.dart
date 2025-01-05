import 'dart:io';
import 'dart:ui';

import 'package:animezone/config/styles/styles.dart';
import 'package:animezone/core/providers/providers.dart';
import 'package:animezone/core/widgets/splash_screen.dart';
import 'package:animezone/main_screen.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Database database =
      await openDatabase('app.db', version: 1, onCreate: _onCreate);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  if(sharedPreferences.getString('locale') == null){
    sharedPreferences.setString('locale', Platform.localeName);
  }
  runApp(

    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        databaseProvider.overrideWithValue(database),
      ],
      child: const MainScreen(),
    )
  );
}

void _onCreate(Database db, int version) async {
  await db.execute(
      'CREATE TABLE anime (mal_id INTEGER PRIMARY KEY, url TEXT, images TEXT, trailer TEXT, approved INTEGER, titles TEXT, type TEXT, source TEXT, episodes INTEGER, status TEXT, airing INTEGER , aired TEXT, demographics TEXT, themes TEXT, theme TEXT, studios TEXT, duration TEXT, rating TEXT, score NUMERIC, scored_by INTEGER, rank INTEGER, popularity INTEGER, members INTEGER, favorites INTEGER, synopsis TEXT, background TEXT, season TEXT, year INTEGER, genres TEXT, streaming TEXT, external TEXT, relations TEXT, wallpaper TEXT)');
  await db.execute(
      'CREATE TABLE manga (mal_id INTEGER PRIMARY KEY, url TEXT, images TEXT, approved INTEGER, titles TEXT, type TEXT, chapters INTEGER,volumes INTEGER, status TEXT, publishing INTEGER , published TEXT, score NUMERIC, scored_by INTEGER, rank INTEGER, popularity INTEGER, members INTEGER, favorites INTEGER, synopsis TEXT, background TEXT, authors TEXT, themes TEXT,demographics TEXT,  serializations TEXT, genres TEXT, external TEXT, relations TEXT, wallpaper TEXT)');
  await db.execute(
      'CREATE TABLE episode (mal_id INTEGER PRIMARY KEY, url TEXT,anime_data TEXT, title TEXT, images TEXT, title_japanese TEXT, title_romanji TEXT, aired TEXT, synopsis TEXT, duration INTEGER, score NUMERIC, filler INTEGER, recap INTEGER, forum_url TEXT)');
  await db
      .execute('CREATE TABLE collection (name TEXT, list TEXT , type TEXT)');
}
