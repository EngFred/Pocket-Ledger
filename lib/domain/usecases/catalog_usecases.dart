import '../../core/error/result.dart';
import '../entities/product.dart';
import '../entities/product_page.dart';
import '../repositories/catalog_repository.dart';

class GetCachedCatalog {
  final CatalogRepository _repo;
  const GetCachedCatalog(this._repo);

  Future<Result<List<Product>?>> call() => _repo.readFromCache();
}

/// Fetches one page from the network AND merges it into the cache.
/// The controller doesn't have to remember to do both.
class FetchCatalogPage {
  final CatalogRepository _repo;
  const FetchCatalogPage(this._repo);

  Future<Result<ProductPage>> call({
    required int skip,
    required int limit,
  }) async {
    final result = await _repo.fetchPage(skip: skip, limit: limit);
    if (result is Ok<ProductPage>) {
      await _repo.mergeIntoCache(result.value.products);
    }
    return result;
  }
}
