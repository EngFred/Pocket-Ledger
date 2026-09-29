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
        isAutoDispose: true,
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

String _$dioClientHash() => r'ee6dac4661acb6e620b6651d532d6a6c36dfce44';

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
        isAutoDispose: true,
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

String _$apiClientHash() => r'31a51a0989ba59491e9fbec128c864407107045e';

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
        isAutoDispose: true,
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

String _$secureStorageHash() => r'5f0f1e7075cbfc89c9f88bceffd63f21bf812b87';

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
        isAutoDispose: true,
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

String _$tokenStoreHash() => r'f219c54cbe8397f0c7ffb97fd3452b9450715c28';

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
        isAutoDispose: true,
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

String _$settingsStoreHash() => r'e308abbab842e713389d7106c62724c055005977';

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
        isAutoDispose: true,
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

String _$catalogCacheHash() => r'0b443736a7ad4432d879ff150cbc02e6bac7466f';

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
        isAutoDispose: true,
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

String _$expenseDaoHash() => r'8ac34c5008a571e70301e87b60dbf1b30d0b0485';

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
        isAutoDispose: true,
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

String _$authRepositoryHash() => r'02850302fe0a2322a095565235f02948500f88c0';

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
        isAutoDispose: true,
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

String _$catalogRepositoryHash() => r'bf29e1d288ab03f78a41d03af1adf902abd5ba3e';

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
        isAutoDispose: true,
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

String _$expenseRepositoryHash() => r'7e2710ef4a0a1732e0c88760a95096456a407cc9';

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
        isAutoDispose: true,
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
    r'246c6c6e143f2ee70abaf3964e070ecef7e730fa';

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
        isAutoDispose: true,
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

String _$loginUseCaseHash() => r'3dcd67871dd409e48fec25dccaec07b22901b35d';

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
        isAutoDispose: true,
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

String _$logoutUseCaseHash() => r'9dad12162a83228303546bc3426be5e3d03b3d81';

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
        isAutoDispose: true,
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
    r'774515bea137e114cc1cff639c371efc993a142d';

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
        isAutoDispose: true,
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
    r'b305c38ad4fc18848a654dc06523bc4ae332949e';

@ProviderFor(refreshCatalogUseCase)
final refreshCatalogUseCaseProvider = RefreshCatalogUseCaseProvider._();

final class RefreshCatalogUseCaseProvider
    extends $FunctionalProvider<RefreshCatalog, RefreshCatalog, RefreshCatalog>
    with $Provider<RefreshCatalog> {
  RefreshCatalogUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'refreshCatalogUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$refreshCatalogUseCaseHash();

  @$internal
  @override
  $ProviderElement<RefreshCatalog> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RefreshCatalog create(Ref ref) {
    return refreshCatalogUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RefreshCatalog value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RefreshCatalog>(value),
    );
  }
}

String _$refreshCatalogUseCaseHash() =>
    r'bd11b498efb298ccd8b97d8d41ce51aa64d41a25';

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
        isAutoDispose: true,
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
    r'a38d60ce89485319e732a03c03d9ac9783a2d533';

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
        isAutoDispose: true,
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

String _$addExpenseUseCaseHash() => r'1d2954ac37cb924f5f07ca46b436017d0fbd6960';

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
        isAutoDispose: true,
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
    r'8b869356363dbf4f5a1567dee499ef3867a31258';

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
        isAutoDispose: true,
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
    r'f70686847e0d0fb7c68ec2bdf46c4ac2bc6a8824';

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
    extends $AsyncNotifierProvider<CatalogController, List<Product>> {
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

String _$catalogControllerHash() => r'e057fb581d4b4e5badc93a8103b38ce20be0323e';

abstract class _$CatalogController extends $AsyncNotifier<List<Product>> {
  FutureOr<List<Product>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Product>>, List<Product>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Product>>, List<Product>>,
              AsyncValue<List<Product>>,
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
    r'00aea573b212c30c44e230794d01eeac341b309e';

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

@ProviderFor(monthlySummary)
final monthlySummaryProvider = MonthlySummaryFamily._();

final class MonthlySummaryProvider
    extends
        $FunctionalProvider<
          AsyncValue<MonthlySummary>,
          MonthlySummary,
          FutureOr<MonthlySummary>
        >
    with $FutureModifier<MonthlySummary>, $FutureProvider<MonthlySummary> {
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

String _$monthlySummaryHash() => r'2f68c95fd2d4a5ac56a43d3102f5b30a19c962ea';

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
