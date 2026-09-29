import '../../core/error/result.dart';
import '../entities/product.dart';

abstract interface class CatalogRepository {
  Future<Result<List<Product>>> fetchFromNetwork();
  Future<Result<List<Product>?>> readFromCache();
  Future<Result<void>> writeToCache(List<Product> products);
}
