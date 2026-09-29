import 'package:hive_ce/hive.dart';

import '../../../core/error/failure.dart';
import '../../../domain/entities/product.dart';

abstract interface class CatalogCache {
  Future<List<Product>?> read();
  Future<void> merge(List<Product> products);
  Future<void> clear();
}

class CatalogCacheImpl implements CatalogCache {
  static const _key = 'products';
  final Box<dynamic> _box;
  const CatalogCacheImpl(this._box);

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
      // Corrupted entry — treat as empty rather than crash.
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
