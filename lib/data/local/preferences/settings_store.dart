import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entities/settings.dart';

class SettingsStore {
  static const _kTheme = 'settings.themeMode';
  static const _kCurrency = 'settings.currencyCode';

  final SharedPreferences _prefs;
  const SettingsStore(this._prefs);

  AppSettings read() => AppSettings(
    themeMode: _parseTheme(_prefs.getString(_kTheme)),
    currencyCode: _prefs.getString(_kCurrency) ?? 'UGX',
  );

  Future<void> writeThemeMode(ThemeMode mode) =>
      _prefs.setString(_kTheme, mode.name);

  Future<void> writeCurrency(String code) => _prefs.setString(_kCurrency, code);

  static ThemeMode _parseTheme(String? raw) => switch (raw) {
    'light' => ThemeMode.light,
    'dark' => ThemeMode.dark,
    _ => ThemeMode.system,
  };
}
