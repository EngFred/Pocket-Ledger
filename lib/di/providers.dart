import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_ce/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../core/error/result.dart';
import '../core/network/retry.dart';
import '../data/local/cache/catalog_cache.dart';
import '../data/local/database/expense_dao.dart';
import '../data/local/preferences/settings_store.dart';
import '../data/local/secure/token_store.dart';
import '../data/remote/api/api_client.dart';
import '../data/remote/api/dio_factory.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../data/repositories/catalog_repository_impl.dart';
import '../data/repositories/expense_repository_impl.dart';
import '../data/repositories/settings_repository_impl.dart';
import '../domain/entities/expense_entry.dart';
import '../domain/entities/product.dart';
import '../domain/entities/product_page.dart';
import '../domain/entities/settings.dart';
import '../domain/entities/user_session.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/repositories/catalog_repository.dart';
import '../domain/repositories/expense_repository.dart';
import '../domain/repositories/settings_repository.dart';
import '../domain/usecases/auth_usecases.dart';
import '../domain/usecases/catalog_usecases.dart';
import '../domain/usecases/expense_usecases.dart';
import '../presentation/state/catalog_state.dart';

part 'providers.g.dart';

// ─────────────────────────────────────────────────────────────────────────
// Bootstrap values — overridden in main()
// ─────────────────────────────────────────────────────────────────────────

final catalogBoxProvider = Provider<Box<dynamic>>(
  (ref) => throw UnimplementedError('catalogBoxProvider must be overridden'),
);

final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) =>
      throw UnimplementedError('sharedPreferencesProvider must be overridden'),
);

final databaseProvider = Provider<Database>(
  (ref) => throw UnimplementedError('databaseProvider must be overridden'),
);

// ─────────────────────────────────────────────────────────────────────────
// Infrastructure — keepAlive: true is MANDATORY
//
// AutoDispose providers die the moment nothing watches them. A single
// `ref.read` from inside an async flow is enough to trigger disposal at
// the next microtask boundary. For anything holding an open resource
// (Dio, secure storage, DB connections), that's catastrophic: the
// resource closes mid-use. Every non-controller provider in this file
// is keepAlive for that reason.
// ─────────────────────────────────────────────────────────────────────────

@Riverpod(keepAlive: true)
Dio dioClient(Ref ref) {
  final dio = buildDio();
  ref.onDispose(dio.close);
  return dio;
}

@Riverpod(keepAlive: true)
ApiClient apiClient(Ref ref) => ApiClient(ref.watch(dioClientProvider));

@Riverpod(keepAlive: true)
FlutterSecureStorage secureStorage(Ref ref) => const FlutterSecureStorage();

// ─────────────────────────────────────────────────────────────────────────
// Current user — the single source of truth for "whose data is this?"
// Every per-user data source and list controller depends on it. When the
// session changes (login, logout, account switch), these rebuild.
// ─────────────────────────────────────────────────────────────────────────

@Riverpod(keepAlive: true)
int? currentUserId(Ref ref) {
  return ref.watch(authControllerProvider).value?.userId;
}

// ─────────────────────────────────────────────────────────────────────────
// Local storage — one provider per layer
// ─────────────────────────────────────────────────────────────────────────

@Riverpod(keepAlive: true)
TokenStore tokenStore(Ref ref) =>
    TokenStoreImpl(ref.watch(secureStorageProvider));

@Riverpod(keepAlive: true)
SettingsStore settingsStore(Ref ref) =>
    SettingsStore(ref.watch(sharedPreferencesProvider));

@Riverpod(keepAlive: true)
CatalogCache catalogCache(Ref ref) {
  final userId = ref.watch(currentUserIdProvider) ?? 0;
  return CatalogCacheImpl(ref.watch(catalogBoxProvider), userId: userId);
}

@Riverpod(keepAlive: true)
ExpenseDao expenseDao(Ref ref) {
  final userId = ref.watch(currentUserIdProvider) ?? 0;
  return ExpenseDao(ref.watch(databaseProvider), userId: userId);
}

// ─────────────────────────────────────────────────────────────────────────
// Repositories
// ─────────────────────────────────────────────────────────────────────────

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) => AuthRepositoryImpl(
  ref.watch(apiClientProvider),
  ref.watch(tokenStoreProvider),
);

@Riverpod(keepAlive: true)
CatalogRepository catalogRepository(Ref ref) => CatalogRepositoryImpl(
  ref.watch(apiClientProvider),
  ref.watch(catalogCacheProvider),
);

@Riverpod(keepAlive: true)
ExpenseRepository expenseRepository(Ref ref) =>
    ExpenseRepositoryImpl(ref.watch(expenseDaoProvider));

@Riverpod(keepAlive: true)
SettingsRepository settingsRepository(Ref ref) =>
    SettingsRepositoryImpl(ref.watch(settingsStoreProvider));

// ─────────────────────────────────────────────────────────────────────────
// Use cases
// ─────────────────────────────────────────────────────────────────────────

@Riverpod(keepAlive: true)
Login loginUseCase(Ref ref) => Login(ref.watch(authRepositoryProvider));

@Riverpod(keepAlive: true)
Logout logoutUseCase(Ref ref) => Logout(ref.watch(authRepositoryProvider));

@Riverpod(keepAlive: true)
GetSavedSession getSavedSessionUseCase(Ref ref) =>
    GetSavedSession(ref.watch(authRepositoryProvider));

@Riverpod(keepAlive: true)
GetCachedCatalog getCachedCatalogUseCase(Ref ref) =>
    GetCachedCatalog(ref.watch(catalogRepositoryProvider));

@Riverpod(keepAlive: true)
FetchCatalogPage fetchCatalogPageUseCase(Ref ref) =>
    FetchCatalogPage(ref.watch(catalogRepositoryProvider));

@Riverpod(keepAlive: true)
GetExpenses getExpensesUseCase(Ref ref) =>
    GetExpenses(ref.watch(expenseRepositoryProvider));

@Riverpod(keepAlive: true)
AddExpense addExpenseUseCase(Ref ref) =>
    AddExpense(ref.watch(expenseRepositoryProvider));

@Riverpod(keepAlive: true)
UpdateExpense updateExpenseUseCase(Ref ref) =>
    UpdateExpense(ref.watch(expenseRepositoryProvider));

@Riverpod(keepAlive: true)
DeleteExpense deleteExpenseUseCase(Ref ref) =>
    DeleteExpense(ref.watch(expenseRepositoryProvider));

@Riverpod(keepAlive: true)
GetMonthlySummary getMonthlySummaryUseCase(Ref ref) =>
    GetMonthlySummary(ref.watch(expenseRepositoryProvider));

// ─────────────────────────────────────────────────────────────────────────
// Controllers — autoDispose is correct here; the UI watches them
// ─────────────────────────────────────────────────────────────────────────

@riverpod
class AuthController extends _$AuthController {
  @override
  Future<UserSession?> build() async {
    final result = await ref.read(getSavedSessionUseCaseProvider)();
    return result.fold(onOk: (s) => s, onErr: (_) => null);
  }

  Future<Result<UserSession>> login(String username, String password) async {
    final result = await ref.read(loginUseCaseProvider)(username, password);
    if (result is Ok<UserSession>) {
      state = AsyncData(result.value);
    }
    return result;
  }

  Future<void> logout() async {
    await ref.read(logoutUseCaseProvider)();
    state = const AsyncData(null);
  }
}

@riverpod
class CatalogController extends _$CatalogController {
  static const _pageSize = 20;

  @override
  Future<CatalogState> build() async {
    // Rebuild whenever the signed-in user changes.
    ref.watch(currentUserIdProvider);

    final cached = await ref.read(getCachedCatalogUseCaseProvider)();
    final cachedItems = cached.fold(
      onOk: (v) => v ?? const <Product>[],
      onErr: (_) => const <Product>[],
    );

    // No cache — we must wait for the network. Errors surface as AsyncError
    // and the screen shows the error panel.
    if (cachedItems.isEmpty) {
      final result = await ref.read(fetchCatalogPageUseCaseProvider)(
        skip: 0,
        limit: _pageSize,
      );
      return result.fold(
        onOk: (page) => CatalogState(
          items: page.products,
          total: page.total,
          hasMore: page.products.length < page.total,
        ),
        onErr: (f) => throw f,
      );
    }

    // Cache present — show it immediately, refresh in the background.
    Future.microtask(() => _fetch(skip: 0, replace: true, silent: true));
    return CatalogState(
      items: cachedItems,
      total: cachedItems.length,
      hasMore: true,
    );
  }

  /// Triggered by the scroll listener when the user nears the bottom.
  Future<void> loadMore() async {
    final current = state.value;
    if (current == null) return;
    if (current.isLoadingMore || !current.hasMore) return;

    state = AsyncData(current.copyWith(isLoadingMore: true));
    await _fetch(skip: current.items.length, replace: false, silent: false);
  }

  /// Pull-to-refresh and the AppBar button. Reloads page 0 and resets
  /// pagination. On error, keeps whatever the user was already looking at.
  Future<void> refresh() async {
    final result = await ref.read(fetchCatalogPageUseCaseProvider)(
      skip: 0,
      limit: _pageSize,
    );

    if (result is Ok<ProductPage>) {
      final page = result.value;
      state = AsyncData(
        CatalogState(
          items: page.products,
          total: page.total,
          hasMore: page.products.length < page.total,
        ),
      );
    }
  }

  Future<void> _fetch({
    required int skip,
    required bool replace,
    required bool silent,
  }) async {
    final useCase = ref.read(fetchCatalogPageUseCaseProvider);

    // Silent background refresh gets retried with backoff. User-initiated
    // loads (pull-to-refresh, "Load more") do not — the user sees the
    // spinner and can retry by tapping again.
    final result = silent
        ? await withRetry(() => useCase(skip: skip, limit: _pageSize))
        : await useCase(skip: skip, limit: _pageSize);

    result.fold(
      onOk: (page) {
        final current = state.value ?? const CatalogState();
        final items = replace
            ? page.products
            : _mergeById(current.items, page.products);

        state = AsyncData(
          CatalogState(
            items: items,
            total: page.total,
            hasMore: items.length < page.total,
            isLoadingMore: false,
          ),
        );
      },
      onErr: (_) {
        // Silent background failure: stop advertising more pages so the
        // footer doesn't spin forever on a request that will never land.
        if (silent) {
          final current = state.value;
          if (current != null && current.hasMore) {
            state = AsyncData(current.copyWith(hasMore: false));
          }
          return;
        }
        // Footer-load failure: drop the spinner but keep what's on screen.
        final current = state.value;
        if (current != null) {
          state = AsyncData(current.copyWith(isLoadingMore: false));
        }
      },
    );
  }

  List<Product> _mergeById(List<Product> existing, List<Product> incoming) {
    final byId = <int, Product>{for (final p in existing) p.id: p};
    for (final p in incoming) {
      byId[p.id] = p;
    }
    final merged = byId.values.toList()..sort((a, b) => a.id.compareTo(b.id));
    return List.unmodifiable(merged);
  }
}

@riverpod
class ExpensesController extends _$ExpensesController {
  @override
  Future<List<ExpenseEntry>> build() async {
    // Rebuild whenever the signed-in user changes.
    ref.watch(currentUserIdProvider);

    final result = await ref.read(getExpensesUseCaseProvider)();
    return result.getOrThrow();
  }

  Future<Result<int>> add(ExpenseEntry entry) async {
    final result = await ref.read(addExpenseUseCaseProvider)(entry);
    if (result.isOk) {
      ref.invalidateSelf();
      ref.invalidate(monthlySummaryProvider);
    }
    return result;
  }

  Future<Result<void>> edit(ExpenseEntry entry) async {
    final result = await ref.read(updateExpenseUseCaseProvider)(entry);
    if (result.isOk) {
      ref.invalidateSelf();
      ref.invalidate(monthlySummaryProvider);
    }
    return result;
  }

  Future<Result<void>> delete(int id) async {
    final result = await ref.read(deleteExpenseUseCaseProvider)(id);
    if (result.isOk) {
      ref.invalidateSelf();
      ref.invalidate(monthlySummaryProvider);
    }
    return result;
  }
}

/// Reads the monthly summary. Does NOT watch `expensesControllerProvider` —
/// that would re-run the SQL query on every state transition of the
/// expenses list (including the initial loading -> data), which keeps the
/// summary permanently at `loading`. Instead, `ExpensesController` calls
/// `ref.invalidate(monthlySummaryProvider)` after successful mutations.
@riverpod
Future<MonthlySummary> monthlySummary(Ref ref, DateTime month) async {
  // The summary is per-user too. Without this watch, switching accounts
  // would leave the previous user's summary on screen.
  ref.watch(currentUserIdProvider);

  final result = await ref.read(getMonthlySummaryUseCaseProvider)(month);
  return result.getOrThrow();
}

@riverpod
class SettingsController extends _$SettingsController {
  @override
  AppSettings build() => ref.read(settingsRepositoryProvider).read();

  Future<void> setThemeMode(ThemeMode mode) async {
    await ref.read(settingsRepositoryProvider).setThemeMode(mode);
    state = state.copyWith(themeMode: mode);
  }

  Future<void> setCurrency(String code) async {
    await ref.read(settingsRepositoryProvider).setCurrency(code);
    state = state.copyWith(currencyCode: code);
  }
}
