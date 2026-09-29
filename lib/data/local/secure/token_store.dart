import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/error/failure.dart';
import '../../../domain/entities/user_session.dart';

abstract interface class TokenStore {
  Future<void> write(UserSession session);
  Future<UserSession?> read();
  Future<void> clear();
}

class TokenStoreImpl implements TokenStore {
  static const _key = 'pocket_ledger.session';
  final FlutterSecureStorage _storage;
  const TokenStoreImpl(this._storage);

  @override
  Future<void> write(UserSession session) async {
    try {
      await _storage.write(key: _key, value: jsonEncode(session.toJson()));
    } catch (_) {
      throw const StorageFailure('Could not save your session.');
    }
  }

  @override
  Future<UserSession?> read() async {
    try {
      final raw = await _storage.read(key: _key);
      if (raw == null) return null;
      return UserSession.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {
      // Corrupted entry — treat as no session rather than crash.
      await _storage.delete(key: _key);
      return null;
    }
  }

  @override
  Future<void> clear() async {
    try {
      await _storage.delete(key: _key);
    } catch (_) {
      throw const StorageFailure('Could not clear your session.');
    }
  }
}
