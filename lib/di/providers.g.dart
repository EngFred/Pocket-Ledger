// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dioClient)
final dioClientProvider = DioClientProvider._();

final class DioClientProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  DioClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioClientHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dioClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioClientHash() => r'b8f002e25e41597fda9b05fea6252498e5028f57';

@ProviderFor(apiClient)
final apiClientProvider = ApiClientProvider._();

final class ApiClientProvider
    extends $FunctionalProvider<ApiClient, ApiClient, ApiClient>
    with $Provider<ApiClient> {
  ApiClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'apiClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$apiClientHash();

  @$internal
  @override
  $ProviderElement<ApiClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ApiClient create(Ref ref) {
    return apiClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApiClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ApiClient>(value),
    );
  }
}

String _$apiClientHash() => r'4924497dc300ac1aff6afcf623f157adbc350756';

@ProviderFor(secureStorage)
final secureStorageProvider = SecureStorageProvider._();

final class SecureStorageProvider
    extends
        $FunctionalProvider<
          FlutterSecureStorage,
          FlutterSecureStorage,
          FlutterSecureStorage
        >
    with $Provider<FlutterSecureStorage> {
  SecureStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'secureStorageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$secureStorageHash();

  @$internal
  @override
  $ProviderElement<FlutterSecureStorage> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FlutterSecureStorage create(Ref ref) {
    return secureStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FlutterSecureStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FlutterSecureStorage>(value),
    );
  }
}

String _$secureStorageHash() => r'0cd1b80f91784467390034386f925a0be155bfbd';

@ProviderFor(currentUserId)
final currentUserIdProvider = CurrentUserIdProvider._();

final class CurrentUserIdProvider extends $FunctionalProvider<int?, int?, int?>
    with $Provider<int?> {
  CurrentUserIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserIdProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserIdHash();

  @$internal
  @override
  $ProviderElement<int?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int? create(Ref ref) {
    return currentUserId(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int?>(value),
    );
  }
}

String _$currentUserIdHash() => r'432e03355ef4135722e1f39a0e5850478967e470';

@ProviderFor(tokenStore)
final tokenStoreProvider = TokenStoreProvider._();

final class TokenStoreProvider
    extends $FunctionalProvider<TokenStore, TokenStore, TokenStore>
    with $Provider<TokenStore> {
  TokenStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tokenStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tokenStoreHash();

  @$internal
  @override
  $ProviderElement<TokenStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TokenStore create(Ref ref) {
    return tokenStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TokenStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TokenStore>(value),
    );
  }
}

String _$tokenStoreHash() => r'a2110b12d09311f3c7b8da6c5ceb849ba3a02542';

@ProviderFor(settingsStore)
final settingsStoreProvider = SettingsStoreProvider._();

final class SettingsStoreProvider
    extends $FunctionalProvider<SettingsStore, SettingsStore, SettingsStore>
    with $Provider<SettingsStore> {
  SettingsStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsStoreHash();

  @$internal
  @override
  $ProviderElement<SettingsStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SettingsStore create(Ref ref) {
    return settingsStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingsStore>(value),
    );
  }
}

String _$settingsStoreHash() => r'e5786f9f681807cc2238d355a14fe40e049dc11d';

@ProviderFor(catalogCache)
final catalogCacheProvider = CatalogCacheProvider._();

final class CatalogCacheProvider
    extends $FunctionalProvider<CatalogCache, CatalogCache, CatalogCache>
    with $Provider<CatalogCache> {
  CatalogCacheProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'catalogCacheProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$catalogCacheHash();

  @$internal
  @override
  $ProviderElement<CatalogCache> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CatalogCache create(Ref ref) {
    return catalogCache(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CatalogCache value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CatalogCache>(value),
    );
  }
}

String _$catalogCacheHash() => r'54def8d3211931dc0a148fe6bcd775b56e5f7f51';

@ProviderFor(expenseDao)
final expenseDaoProvider = ExpenseDaoProvider._();

final class ExpenseDaoProvider
    extends $FunctionalProvider<ExpenseDao, ExpenseDao, ExpenseDao>
    with $Provider<ExpenseDao> {
  ExpenseDaoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'expenseDaoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$expenseDaoHash();

  @$internal
  @override
  $ProviderElement<ExpenseDao> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ExpenseDao create(Ref ref) {
    return expenseDao(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ExpenseDao value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ExpenseDao>(value),
    );
  }
}

String _$expenseDaoHash() => r'89fbc040dc20db27cbb3a99b105c638c2cb46f42';

@ProviderFor(authRepository)
final authRepositoryProvider = AuthRepositoryProvider._();

final class AuthRepositoryProvider
    extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
  AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepository create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepository>(value),
    );
  }
}

String _$authRepositoryHash() => r'e2a4f70338ab8ea5458e762cb38fd8d9526eccb6';

@ProviderFor(catalogRepository)
final catalogRepositoryProvider = CatalogRepositoryProvider._();

final class CatalogRepositoryProvider
    extends
        $FunctionalProvider<
          CatalogRepository,
          CatalogRepository,
          CatalogRepository
        >
    with $Provider<CatalogRepository> {
  CatalogRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'catalogRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$catalogRepositoryHash();

  @$internal
  @override
  $ProviderElement<CatalogRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CatalogRepository create(Ref ref) {
    return catalogRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CatalogRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CatalogRepository>(value),
    );
  }
}

String _$catalogRepositoryHash() => r'f4e40f6b3e2371ee1a76fe19069b92b33c45147c';

@ProviderFor(expenseRepository)
final expenseRepositoryProvider = ExpenseRepositoryProvider._();

final class ExpenseRepositoryProvider
    extends
        $FunctionalProvider<
          ExpenseRepository,
          ExpenseRepository,
          ExpenseRepository
        >
    with $Provider<ExpenseRepository> {
  ExpenseRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'expenseRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$expenseRepositoryHash();

  @$internal
  @override
  $ProviderElement<ExpenseRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ExpenseRepository create(Ref ref) {
    return expenseRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ExpenseRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ExpenseRepository>(value),
    );
  }
}

String _$expenseRepositoryHash() => r'ecb15d0dc07c005cba921e0c1556bfe813ed61d4';

@ProviderFor(settingsRepository)
final settingsRepositoryProvider = SettingsRepositoryProvider._();

final class SettingsRepositoryProvider
    extends
        $FunctionalProvider<
          SettingsRepository,
          SettingsRepository,
          SettingsRepository
        >
    with $Provider<SettingsRepository> {
  SettingsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsRepositoryHash();

  @$internal
  @override
  $ProviderElement<SettingsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SettingsRepository create(Ref ref) {
    return settingsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingsRepository>(value),
    );
  }
}

String _$settingsRepositoryHash() =>
    r'2fd9535d048238ad219aea2a608c6549a9dbb3c3';

@ProviderFor(loginUseCase)
final loginUseCaseProvider = LoginUseCaseProvider._();

final class LoginUseCaseProvider
    extends $FunctionalProvider<Login, Login, Login>
    with $Provider<Login> {
  LoginUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginUseCaseHash();

  @$internal
  @override
  $ProviderElement<Login> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Login create(Ref ref) {
    return loginUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Login value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Login>(value),
    );
  }
}

String _$loginUseCaseHash() => r'775f951f09e80feb01ac1441a74c85179e299f94';

@ProviderFor(logoutUseCase)
final logoutUseCaseProvider = LogoutUseCaseProvider._();

final class LogoutUseCaseProvider
    extends $FunctionalProvider<Logout, Logout, Logout>
    with $Provider<Logout> {
  LogoutUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logoutUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logoutUseCaseHash();

  @$internal
  @override
  $ProviderElement<Logout> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Logout create(Ref ref) {
    return logoutUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Logout value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Logout>(value),
    );
  }
}

String _$logoutUseCaseHash() => r'36d78569231076b649817e6cf24d4d18e063f382';

@ProviderFor(getSavedSessionUseCase)
final getSavedSessionUseCaseProvider = GetSavedSessionUseCaseProvider._();

final class GetSavedSessionUseCaseProvider
    extends
        $FunctionalProvider<GetSavedSession, GetSavedSession, GetSavedSession>
    with $Provider<GetSavedSession> {
  GetSavedSessionUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getSavedSessionUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getSavedSessionUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetSavedSession> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetSavedSession create(Ref ref) {
    return getSavedSessionUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetSavedSession value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetSavedSession>(value),
    );
  }
}

String _$getSavedSessionUseCaseHash() =>
    r'd95ff621e86a23a94a8ae552464b9c853b8b1dd0';

@ProviderFor(getCachedCatalogUseCase)
final getCachedCatalogUseCaseProvider = GetCachedCatalogUseCaseProvider._();

final class GetCachedCatalogUseCaseProvider
    extends
        $FunctionalProvider<
          GetCachedCatalog,
          GetCachedCatalog,
          GetCachedCatalog
        >
    with $Provider<GetCachedCatalog> {
  GetCachedCatalogUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCachedCatalogUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCachedCatalogUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetCachedCatalog> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetCachedCatalog create(Ref ref) {
    return getCachedCatalogUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetCachedCatalog value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetCachedCatalog>(value),
    );
  }
}

String _$getCachedCatalogUseCaseHash() =>
    r'0677652cd96b1055da1e8203766cdbfe39d6f137';

@ProviderFor(fetchCatalogPageUseCase)
final fetchCatalogPageUseCaseProvider = FetchCatalogPageUseCaseProvider._();

final class FetchCatalogPageUseCaseProvider
    extends
        $FunctionalProvider<
          FetchCatalogPage,
          FetchCatalogPage,
          FetchCatalogPage
        >
    with $Provider<FetchCatalogPage> {
  FetchCatalogPageUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchCatalogPageUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchCatalogPageUseCaseHash();

  @$internal
  @override
  $ProviderElement<FetchCatalogPage> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FetchCatalogPage create(Ref ref) {
    return fetchCatalogPageUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FetchCatalogPage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FetchCatalogPage>(value),
    );
  }
}

String _$fetchCatalogPageUseCaseHash() =>
    r'769503b49437e45b703bac619db817d29b9ab264';

@ProviderFor(getExpensesUseCase)
final getExpensesUseCaseProvider = GetExpensesUseCaseProvider._();

final class GetExpensesUseCaseProvider
    extends $FunctionalProvider<GetExpenses, GetExpenses, GetExpenses>
    with $Provider<GetExpenses> {
  GetExpensesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getExpensesUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getExpensesUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetExpenses> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetExpenses create(Ref ref) {
    return getExpensesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetExpenses value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetExpenses>(value),
    );
  }
}

String _$getExpensesUseCaseHash() =>
    r'e097e3e5a9398fa9182fcb9e66cdd47c414e716f';

@ProviderFor(addExpenseUseCase)
final addExpenseUseCaseProvider = AddExpenseUseCaseProvider._();

final class AddExpenseUseCaseProvider
    extends $FunctionalProvider<AddExpense, AddExpense, AddExpense>
    with $Provider<AddExpense> {
  AddExpenseUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addExpenseUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addExpenseUseCaseHash();

  @$internal
  @override
  $ProviderElement<AddExpense> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AddExpense create(Ref ref) {
    return addExpenseUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddExpense value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddExpense>(value),
    );
  }
}

String _$addExpenseUseCaseHash() => r'a11f7654e19294b4502989de88cd4e7b0f86a8be';

@ProviderFor(updateExpenseUseCase)
final updateExpenseUseCaseProvider = UpdateExpenseUseCaseProvider._();

final class UpdateExpenseUseCaseProvider
    extends $FunctionalProvider<UpdateExpense, UpdateExpense, UpdateExpense>
    with $Provider<UpdateExpense> {
  UpdateExpenseUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateExpenseUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateExpenseUseCaseHash();

  @$internal
  @override
  $ProviderElement<UpdateExpense> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UpdateExpense create(Ref ref) {
    return updateExpenseUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateExpense value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateExpense>(value),
    );
  }
}

String _$updateExpenseUseCaseHash() =>
    r'289a9831247270994a55e338cc42f7bf14772769';

@ProviderFor(deleteExpenseUseCase)
final deleteExpenseUseCaseProvider = DeleteExpenseUseCaseProvider._();

final class DeleteExpenseUseCaseProvider
    extends $FunctionalProvider<DeleteExpense, DeleteExpense, DeleteExpense>
    with $Provider<DeleteExpense> {
  DeleteExpenseUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteExpenseUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteExpenseUseCaseHash();

  @$internal
  @override
  $ProviderElement<DeleteExpense> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DeleteExpense create(Ref ref) {
    return deleteExpenseUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteExpense value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteExpense>(value),
    );
  }
}

String _$deleteExpenseUseCaseHash() =>
    r'e77408eb3f9f69b020ff7724debdf6d5c3cdd094';

@ProviderFor(getMonthlySummaryUseCase)
final getMonthlySummaryUseCaseProvider = GetMonthlySummaryUseCaseProvider._();

final class GetMonthlySummaryUseCaseProvider
    extends
        $FunctionalProvider<
          GetMonthlySummary,
          GetMonthlySummary,
          GetMonthlySummary
        >
    with $Provider<GetMonthlySummary> {
  GetMonthlySummaryUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMonthlySummaryUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMonthlySummaryUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetMonthlySummary> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetMonthlySummary create(Ref ref) {
    return getMonthlySummaryUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetMonthlySummary value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetMonthlySummary>(value),
    );
  }
}

String _$getMonthlySummaryUseCaseHash() =>
    r'8c819537d29e86f3e9dfafb49b9d8e97e02ea421';

@ProviderFor(AuthController)
final authControllerProvider = AuthControllerProvider._();

final class AuthControllerProvider
    extends $AsyncNotifierProvider<AuthController, UserSession?> {
  AuthControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authControllerHash();

  @$internal
  @override
  AuthController create() => AuthController();
}

String _$authControllerHash() => r'2d39946ace4bef2d14fd013fdedd8ced216b4bfd';

abstract class _$AuthController extends $AsyncNotifier<UserSession?> {
  FutureOr<UserSession?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<UserSession?>, UserSession?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UserSession?>, UserSession?>,
              AsyncValue<UserSession?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(CatalogController)
final catalogControllerProvider = CatalogControllerProvider._();

final class CatalogControllerProvider
    extends $AsyncNotifierProvider<CatalogController, CatalogState> {
  CatalogControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'catalogControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$catalogControllerHash();

  @$internal
  @override
  CatalogController create() => CatalogController();
}

String _$catalogControllerHash() => r'dadb05851028ffd1c058ffd43ca3960d8833ba44';

abstract class _$CatalogController extends $AsyncNotifier<CatalogState> {
  FutureOr<CatalogState> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<CatalogState>, CatalogState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<CatalogState>, CatalogState>,
              AsyncValue<CatalogState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(ExpensesController)
final expensesControllerProvider = ExpensesControllerProvider._();

final class ExpensesControllerProvider
    extends $AsyncNotifierProvider<ExpensesController, List<ExpenseEntry>> {
  ExpensesControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'expensesControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$expensesControllerHash();

  @$internal
  @override
  ExpensesController create() => ExpensesController();
}

String _$expensesControllerHash() =>
    r'96e92467a10cebc1c246312abb7433cce2dcc873';

abstract class _$ExpensesController extends $AsyncNotifier<List<ExpenseEntry>> {
  FutureOr<List<ExpenseEntry>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<ExpenseEntry>>, List<ExpenseEntry>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ExpenseEntry>>, List<ExpenseEntry>>,
              AsyncValue<List<ExpenseEntry>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Reads the monthly summary. Does NOT watch `expensesControllerProvider` —
/// that would re-run the SQL query on every state transition of the
/// expenses list (including the initial loading -> data), which keeps the
/// summary permanently at `loading`. Instead, `ExpensesController` calls
/// `ref.invalidate(monthlySummaryProvider)` after successful mutations.

@ProviderFor(monthlySummary)
final monthlySummaryProvider = MonthlySummaryFamily._();

/// Reads the monthly summary. Does NOT watch `expensesControllerProvider` —
/// that would re-run the SQL query on every state transition of the
/// expenses list (including the initial loading -> data), which keeps the
/// summary permanently at `loading`. Instead, `ExpensesController` calls
/// `ref.invalidate(monthlySummaryProvider)` after successful mutations.

final class MonthlySummaryProvider
    extends
        $FunctionalProvider<
          AsyncValue<MonthlySummary>,
          MonthlySummary,
          FutureOr<MonthlySummary>
        >
    with $FutureModifier<MonthlySummary>, $FutureProvider<MonthlySummary> {
  /// Reads the monthly summary. Does NOT watch `expensesControllerProvider` —
  /// that would re-run the SQL query on every state transition of the
  /// expenses list (including the initial loading -> data), which keeps the
  /// summary permanently at `loading`. Instead, `ExpensesController` calls
  /// `ref.invalidate(monthlySummaryProvider)` after successful mutations.
  MonthlySummaryProvider._({
    required MonthlySummaryFamily super.from,
    required DateTime super.argument,
  }) : super(
         retry: null,
         name: r'monthlySummaryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$monthlySummaryHash();

  @override
  String toString() {
    return r'monthlySummaryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<MonthlySummary> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<MonthlySummary> create(Ref ref) {
    final argument = this.argument as DateTime;
    return monthlySummary(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is MonthlySummaryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$monthlySummaryHash() => r'fc13250136d85f0be02261d153a571fa252798b4';

/// Reads the monthly summary. Does NOT watch `expensesControllerProvider` —
/// that would re-run the SQL query on every state transition of the
/// expenses list (including the initial loading -> data), which keeps the
/// summary permanently at `loading`. Instead, `ExpensesController` calls
/// `ref.invalidate(monthlySummaryProvider)` after successful mutations.

final class MonthlySummaryFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<MonthlySummary>, DateTime> {
  MonthlySummaryFamily._()
    : super(
        retry: null,
        name: r'monthlySummaryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Reads the monthly summary. Does NOT watch `expensesControllerProvider` —
  /// that would re-run the SQL query on every state transition of the
  /// expenses list (including the initial loading -> data), which keeps the
  /// summary permanently at `loading`. Instead, `ExpensesController` calls
  /// `ref.invalidate(monthlySummaryProvider)` after successful mutations.

  MonthlySummaryProvider call(DateTime month) =>
      MonthlySummaryProvider._(argument: month, from: this);

  @override
  String toString() => r'monthlySummaryProvider';
}

@ProviderFor(SettingsController)
final settingsControllerProvider = SettingsControllerProvider._();

final class SettingsControllerProvider
    extends $NotifierProvider<SettingsController, AppSettings> {
  SettingsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsControllerHash();

  @$internal
  @override
  SettingsController create() => SettingsController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppSettings value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppSettings>(value),
    );
  }
}

String _$settingsControllerHash() =>
    r'6f79b5a53479a88cbddfe3381272590f2a2317c1';

abstract class _$SettingsController extends $Notifier<AppSettings> {
  AppSettings build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AppSettings, AppSettings>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppSettings, AppSettings>,
              AppSettings,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
