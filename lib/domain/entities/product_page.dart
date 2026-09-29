import 'package:freezed_annotation/freezed_annotation.dart';

import 'product.dart';

part 'product_page.freezed.dart';

@freezed
abstract class ProductPage with _$ProductPage {
  const ProductPage._();

  const factory ProductPage({
    required List<Product> products,
    required int total,
    required int skip,
    required int limit,
  }) = _ProductPage;

  /// True when there's another window after this one on the server.
  bool get hasMore => skip + products.length < total;
}
