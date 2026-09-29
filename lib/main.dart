import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';
import 'data/local/database/app_database.dart';
import 'di/providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Storage layer 3: Hive cache box.
  await Hive.initFlutter();
  final catalogBox = await Hive.openBox<dynamic>('catalog');

  // Storage layer 2: preferences.
  final prefs = await SharedPreferences.getInstance();

  // Storage layer 4: SQL database.
  final database = await AppDatabase.open();

  runApp(
    ProviderScope(
      overrides: [
        catalogBoxProvider.overrideWithValue(catalogBox),
        sharedPreferencesProvider.overrideWithValue(prefs),
        databaseProvider.overrideWithValue(database),
      ],
      child: const App(),
    ),
  );
}
