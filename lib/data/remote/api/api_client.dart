import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'dtos.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @POST('/auth/login')
  Future<LoginResponseDto> login(@Body() Map<String, dynamic> body);

  @GET('/products')
  Future<ProductListDto> getProducts({
    @Query('limit') int? limit,
    @Query('skip') int? skip,
  });
}
