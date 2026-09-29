import 'package:flutter/material.dart';

import '../../domain/entities/settings.dart';
import '../../domain/repositories/settings_repository.dart';
import '../local/preferences/settings_store.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsStore _store;
  const SettingsRepositoryImpl(this._store);

  @override
  AppSettings read() => _store.read();

  @override
  Future<void> setThemeMode(ThemeMode mode) => _store.writeThemeMode(mode);

  @override
  Future<void> setCurrency(String code) => _store.writeCurrency(code);
}
