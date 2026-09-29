import 'package:hive_ce/hive.dart';

import '../../../core/error/failure.dart';
import '../../../domain/entities/product.dart';

abstract interface class CatalogCache {
  Future<List<Product>?> read();
  Future<void> merge(List<Product> products);
  Future<void> clear();
}

class CatalogCacheImpl implements CatalogCache {
  final Box<dynamic> _box;
  final int _userId;
  const CatalogCacheImpl(this._box, {required int userId}) : _userId = userId;

  /// One key per user. User A's cached catalog is invisible to user B,
  /// and remains on disk so A sees it again when they sign back in.
  String get _key => 'products.$_userId';

  @override
  Future<List<Product>?> read() async {
    try {
      final raw = _box.get(_key);
      if (raw is! List) return null;
      return raw
          .cast<Map>()
          .map((m) => Product.fromJson(m.cast<String, dynamic>()))
          .toList(growable: false);
    } catch (_) {
      await _box.delete(_key);
      return null;
    }
  }

  @override
  Future<void> merge(List<Product> products) async {
    try {
      final existing = await read() ?? const <Product>[];
      final byId = <int, Product>{for (final p in existing) p.id: p};
      for (final p in products) {
        byId[p.id] = p;
      }
      final merged = byId.values.toList()..sort((a, b) => a.id.compareTo(b.id));
      await _box.put(
        _key,
        merged.map((p) => p.toJson()).toList(growable: false),
      );
    } catch (_) {
      throw const StorageFailure('Could not cache the catalog.');
    }
  }

  @override
  Future<void> clear() => _box.delete(_key);
}
