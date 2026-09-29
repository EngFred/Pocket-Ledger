import '../../core/error/result.dart';
import '../entities/product.dart';
import '../entities/product_page.dart';

abstract interface class CatalogRepository {
  /// Fetch a single window from the network.
  Future<Result<ProductPage>> fetchPage({
    required int skip,
    required int limit,
  });

  /// Read the merged cache. `Ok(null)` when nothing has been cached yet.
  Future<Result<List<Product>?>> readFromCache();

  /// Merge new products into the cache, deduped by id.
  Future<Result<void>> mergeIntoCache(List<Product> products);
}
