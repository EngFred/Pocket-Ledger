import 'package:dio/dio.dart';

Dio buildDio() {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      contentType: 'application/json',
    ),
  );
  dio.interceptors.add(
    LogInterceptor(
      request: false,
      requestHeader: false,
      responseHeader: false,
      responseBody: false,
      error: true,
    ),
  );
  return dio;
}
