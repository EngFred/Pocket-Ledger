import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../di/providers.dart';
import '../presentation/screens/catalog_screen.dart';
import '../presentation/screens/expense_form_screen.dart';
import '../presentation/screens/expenses_screen.dart';
import '../presentation/screens/login_screen.dart';
import '../presentation/screens/settings_screen.dart';
import '../presentation/screens/splash_screen.dart';

abstract final class Routes {
  static const splash = 'splash';
  static const login = 'login';
  static const catalog = 'catalog';
  static const expenses = 'expenses';
  static const settings = 'settings';
  static const expenseNew = 'expense-new';

  static const splashPath = '/splash';
  static const loginPath = '/login';
  static const catalogPath = '/catalog';
  static const expensesPath = '/expenses';
  static const settingsPath = '/settings';
}

class _AuthRefreshNotifier extends ChangeNotifier {
  _AuthRefreshNotifier(Ref ref) {
    ref.listen(authControllerProvider, (_, __) => notifyListeners());
  }
}

final routerProvider = Provider<GoRouter>((ref) {
  final refresh = _AuthRefreshNotifier(ref);
  ref.onDispose(refresh.dispose);

  return GoRouter(
    initialLocation: Routes.splashPath,
    refreshListenable: refresh,
    redirect: (context, state) {
      final auth = ref.read(authControllerProvider);
      final at = state.matchedLocation;

      if (auth.isLoading) {
        return at == Routes.splashPath ? null : Routes.splashPath;
      }

      final loggedIn = auth.value != null;

      if (!loggedIn) {
        return at == Routes.loginPath ? null : Routes.loginPath;
      }

      if (at == Routes.loginPath || at == Routes.splashPath) {
        return Routes.catalogPath;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: Routes.splashPath,
        name: Routes.splash,
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: Routes.loginPath,
        name: Routes.login,
        builder: (_, __) => const LoginScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (_, __, shell) => _DashboardShell(shell: shell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.catalogPath,
                name: Routes.catalog,
                builder: (_, __) => const CatalogScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.expensesPath,
                name: Routes.expenses,
                builder: (_, __) => const ExpensesScreen(),
                routes: [
                  GoRoute(
                    path: 'new',
                    name: Routes.expenseNew,
                    builder: (_, __) => const ExpenseFormScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.settingsPath,
                name: Routes.settings,
                builder: (_, __) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});

class _DashboardShell extends StatelessWidget {
  final StatefulNavigationShell shell;
  const _DashboardShell({required this.shell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: shell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: shell.currentIndex,
        onDestinationSelected: shell.goBranch,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.grid_view_outlined),
            selectedIcon: Icon(Icons.grid_view),
            label: 'Catalog',
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined),
            selectedIcon: Icon(Icons.receipt_long),
            label: 'Expenses',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
