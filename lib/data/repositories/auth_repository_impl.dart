import 'package:dio/dio.dart';

import '../../core/error/failure.dart';
import '../../core/error/result.dart';
import '../../domain/entities/user_session.dart';
import '../../domain/repositories/auth_repository.dart';
import '../local/secure/token_store.dart';
import '../remote/api/api_client.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiClient _api;
  final TokenStore _tokens;

  const AuthRepositoryImpl(this._api, this._tokens);

  @override
  Future<Result<UserSession>> authenticate(String username, String password) =>
      _run(() async {
        final dto = await _api.login({
          'username': username,
          'password': password,
        });
        final session = UserSession(
          userId: dto.id,
          username: dto.username,
          email: dto.email,
          accessToken: dto.accessToken,
        );
        await _tokens.write(session);
        return session;
      });

  @override
  Future<Result<UserSession?>> readSession() => _run(_tokens.read);

  @override
  Future<Result<void>> clearSession() => _run(_tokens.clear);

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
      case DioExceptionType.badResponse:
        final body = e.response?.data;
        final msg = body is Map && body['message'] is String
            ? body['message'] as String
            : 'Invalid username or password.';
        return AuthFailure(msg, e.response?.statusCode);
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return const TimeoutFailure();
      case DioExceptionType.connectionError:
        return const NetworkFailure();
      default:
        return const UnexpectedFailure();
    }
  }
}
