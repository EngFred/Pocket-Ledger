import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

Dio buildDio() {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      contentType: 'application/json',
    ),
  );

  if (kDebugMode) {
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: false, // Authorization header would leak here
        requestBody: true,
        responseHeader: false,
        responseBody: false, // accessToken would leak here
        error: true, // we want to see failure reasons
        logPrint: (obj) => debugPrint('[dio] $obj'),
      ),
    );
  }

  return dio;
}
