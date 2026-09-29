import '../../core/error/result.dart';
import '../entities/product.dart';
import '../repositories/catalog_repository.dart';

class GetCachedCatalog {
  final CatalogRepository _repo;
  const GetCachedCatalog(this._repo);

  Future<Result<List<Product>?>> call() => _repo.readFromCache();
}

class RefreshCatalog {
  final CatalogRepository _repo;
  const RefreshCatalog(this._repo);

  /// Fetch from network, then persist. Returns what was fetched.
  Future<Result<List<Product>>> call() async {
    final result = await _repo.fetchFromNetwork();
    if (result is Ok<List<Product>>) {
      await _repo.writeToCache(result.value);
    }
    return result;
  }
}
