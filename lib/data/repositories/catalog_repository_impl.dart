import 'package:dio/dio.dart';

import '../../core/error/dio_failure_mapper.dart';
import '../../core/error/failure.dart';
import '../../core/error/result.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/product_page.dart';
import '../../domain/repositories/catalog_repository.dart';
import '../local/cache/catalog_cache.dart';
import '../remote/api/api_client.dart';

class CatalogRepositoryImpl implements CatalogRepository {
  final ApiClient _api;
  final CatalogCache _cache;

  const CatalogRepositoryImpl(this._api, this._cache);

  @override
  Future<Result<ProductPage>> fetchPage({
    required int skip,
    required int limit,
  }) => _run(() async {
    final dto = await _api.getProducts(skip: skip, limit: limit);
    final products = dto.products
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
    return ProductPage(
      products: products,
      total: dto.total,
      // Use the values we asked for; do not trust the DTO's defaults.
      skip: skip,
      limit: limit,
    );
  });

  @override
  Future<Result<List<Product>?>> readFromCache() => _run(_cache.read);

  @override
  Future<Result<void>> mergeIntoCache(List<Product> products) =>
      _run(() => _cache.merge(products));

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
