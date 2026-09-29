import 'package:dio/dio.dart';

import '../../core/error/dio_failure_mapper.dart';
import '../../core/error/failure.dart';
import '../../core/error/result.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/catalog_repository.dart';
import '../local/cache/catalog_cache.dart';
import '../remote/api/api_client.dart';

class CatalogRepositoryImpl implements CatalogRepository {
  final ApiClient _api;
  final CatalogCache _cache;

  const CatalogRepositoryImpl(this._api, this._cache);

  @override
  Future<Result<List<Product>>> fetchFromNetwork() => _run(() async {
    final dto = await _api.getProducts(limit: 30);
    return dto.products
        .map(
          (p) => Product(
            id: p.id,
            title: p.title,
            description: p.description,
            price: p.price,
            category: p.category,
            thumbnail: p.thumbnail,
          ),
        )
        .toList(growable: false);
  });

  @override
  Future<Result<List<Product>?>> readFromCache() => _run(_cache.read);

  @override
  Future<Result<void>> writeToCache(List<Product> products) =>
      _run(() => _cache.write(products));

  Future<Result<T>> _run<T>(Future<T> Function() body) async {
    try {
      return Ok(await body());
    } on DioException catch (e) {
      return Err(mapDioException(e));
    } on Failure catch (e) {
      return Err(e);
    } catch (_) {
      return const Err(UnexpectedFailure());
    }
  }
}
