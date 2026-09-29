import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'failure.dart';

/// Single source of truth for turning a [DioException] into a [Failure].
///
/// Every repository calls this. If Dio ever renames an enum value or adds
/// a new one, this file is the only place that needs to change — not every
/// repository's private `_mapDio`.
Failure mapDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.transformTimeout:
      return const TimeoutFailure();

    case DioExceptionType.connectionError:
      return const NetworkFailure();

    case DioExceptionType.badCertificate:
      return const NetworkFailure('Secure connection failed.');

    case DioExceptionType.cancel:
      // Usually a disposed provider or a user navigating away. Not
      // user-facing; surface as unexpected so it still shows up in logs.
      return const UnexpectedFailure('Request was cancelled.');

    case DioExceptionType.badResponse:
      final code = e.response?.statusCode;
      final body = e.response?.data;

      // 4xx with a `message` field: surface that message (dummyjson,
      // most REST APIs). Falls back to a generic text otherwise.
      if (code != null && code >= 400 && code < 500) {
        final msg = (body is Map && body['message'] is String)
            ? body['message'] as String
            : 'Request failed ($code).';
        return AuthFailure(msg, code);
      }

      return ServerFailure('Server error ($code).', code);

    case DioExceptionType.unknown:
      // The interesting case: not a real HTTP failure. Could be a socket
      // exception, an adapter-closed StateError (what bit us earlier),
      // a TLS handshake problem, anything Dio couldn't categorise.
      if (kDebugMode) {
        debugPrint('Dio unknown error: ${e.error}');
        debugPrint('Stack: ${e.stackTrace}');
      }

      final underlying = e.error;
      if (underlying is StateError) {
        return const UnexpectedFailure(
          'Connection layer was closed unexpectedly. Please try again.',
        );
      }
      if (underlying is SocketException) {
        return const NetworkFailure();
      }
      return const UnexpectedFailure();
  }
}
