import 'package:flutter/material.dart';

import '../entities/settings.dart';

abstract interface class SettingsRepository {
  AppSettings read();
  Future<void> setThemeMode(ThemeMode mode);
  Future<void> setCurrency(String code);
}
