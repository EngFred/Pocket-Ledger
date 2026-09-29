import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/product.dart';

part 'catalog_state.freezed.dart';

/// UI state for the paginated catalog. Owns the accumulated list, the
/// server's total count, and the flags the footer needs.
///
/// `hasMore` defaults to `true` so a cold-start empty state can present a
/// "load more" affordance before the first page lands. It's corrected as
/// soon as the first page's `total` is known.
@freezed
abstract class CatalogState with _$CatalogState {
  const factory CatalogState({
    @Default(<Product>[]) List<Product> items,
    @Default(0) int total,
    @Default(true) bool hasMore,
    @Default(false) bool isLoadingMore,
  }) = _CatalogState;
}
