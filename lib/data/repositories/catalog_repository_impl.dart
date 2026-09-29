import 'package:dio/dio.dart';

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
    } on Failure catch (e) {
      return Err(e);
    } on DioException catch (e) {
      return Err(_mapDio(e));
    } catch (_) {
      return const Err(UnexpectedFailure());
    }
  }

  Failure _mapDio(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return const TimeoutFailure();
      case DioExceptionType.connectionError:
        return const NetworkFailure();
      case DioExceptionType.badResponse:
        return ServerFailure(
          'Server error (${e.response?.statusCode}).',
          e.response?.statusCode,
        );
      default:
        return const UnexpectedFailure();
    }
  }
}
