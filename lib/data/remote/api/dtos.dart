import 'package:freezed_annotation/freezed_annotation.dart';

part 'dtos.freezed.dart';
part 'dtos.g.dart';

@freezed
abstract class LoginResponseDto with _$LoginResponseDto {
  const factory LoginResponseDto({
    required int id,
    required String username,
    required String email,
    required String accessToken,
  }) = _LoginResponseDto;

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDtoFromJson(json);
}

@freezed
abstract class ProductListDto with _$ProductListDto {
  const factory ProductListDto({
    required List<ProductDto> products,
    required int total,
    @Default(0) int skip,
    @Default(0) int limit,
  }) = _ProductListDto;

  factory ProductListDto.fromJson(Map<String, dynamic> json) =>
      _$ProductListDtoFromJson(json);
}

@freezed
abstract class ProductDto with _$ProductDto {
  const factory ProductDto({
    required int id,
    required String title,
    required String description,
    required double price,
    required String category,
    required String thumbnail,
  }) = _ProductDto;

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);
}
