import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_ce/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../core/error/result.dart';
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
import '../domain/entities/settings.dart';
import '../domain/entities/user_session.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/repositories/catalog_repository.dart';
import '../domain/repositories/expense_repository.dart';
import '../domain/repositories/settings_repository.dart';
import '../domain/usecases/auth_usecases.dart';
import '../domain/usecases/catalog_usecases.dart';
import '../domain/usecases/expense_usecases.dart';

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
// Local storage — one provider per layer
// ─────────────────────────────────────────────────────────────────────────

@Riverpod(keepAlive: true)
TokenStore tokenStore(Ref ref) =>
    TokenStoreImpl(ref.watch(secureStorageProvider));

@Riverpod(keepAlive: true)
SettingsStore settingsStore(Ref ref) =>
    SettingsStore(ref.watch(sharedPreferencesProvider));

@Riverpod(keepAlive: true)
CatalogCache catalogCache(Ref ref) =>
    CatalogCacheImpl(ref.watch(catalogBoxProvider));

@Riverpod(keepAlive: true)
ExpenseDao expenseDao(Ref ref) => ExpenseDao(ref.watch(databaseProvider));

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
RefreshCatalog refreshCatalogUseCase(Ref ref) =>
    RefreshCatalog(ref.watch(catalogRepositoryProvider));

@Riverpod(keepAlive: true)
GetExpenses getExpensesUseCase(Ref ref) =>
    GetExpenses(ref.watch(expenseRepositoryProvider));

@Riverpod(keepAlive: true)
AddExpense addExpenseUseCase(Ref ref) =>
    AddExpense(ref.watch(expenseRepositoryProvider));

@Riverpod(keepAlive: true)
DeleteExpense deleteExpenseUseCase(Ref ref) =>
    DeleteExpense(ref.watch(expenseRepositoryProvider));

@Riverpod(keepAlive: true)
GetMonthlySummary getMonthlySummaryUseCase(Ref ref) =>
    GetMonthlySummary(ref.watch(expenseRepositoryProvider));

// ─────────────────────────────────────────────────────────────────────────
// Controllers — these CAN be autoDispose, because the UI watches them
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
  @override
  Future<List<Product>> build() async {
    final cached = await ref.read(getCachedCatalogUseCaseProvider)();
    final cachedList = cached.fold(onOk: (v) => v, onErr: (_) => null);

    if (cachedList != null && cachedList.isNotEmpty) {
      Future.microtask(_refresh);
      return cachedList;
    }

    final fresh = await ref.read(refreshCatalogUseCaseProvider)();
    return fresh.getOrThrow();
  }

  Future<void> _refresh() async {
    final result = await ref.read(refreshCatalogUseCaseProvider)();
    if (result is Ok<List<Product>>) {
      state = AsyncData(result.value);
    }
  }

  Future<void> refreshNow() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final result = await ref.read(refreshCatalogUseCaseProvider)();
      return result.getOrThrow();
    });
  }
}

@riverpod
class ExpensesController extends _$ExpensesController {
  @override
  Future<List<ExpenseEntry>> build() async {
    final result = await ref.read(getExpensesUseCaseProvider)();
    return result.getOrThrow();
  }

  Future<Result<int>> add(ExpenseEntry entry) async {
    final result = await ref.read(addExpenseUseCaseProvider)(entry);
    if (result.isOk) {
      ref.invalidateSelf();
      // Invalidate the family (no args) to refresh every month's summary.
      // This is the single point where "expenses changed" is turned into
      // "summary must reload" — not a watch, not a listener.
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
