import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lockin/features/authentication/sign_in/presentation/pages/sign_in_screen.dart';
import 'package:lockin/features/authentication/sign_up/presentation/pages/sign_up_screen.dart';
import 'package:lockin/features/manage_password/presentation/pages/manage_password_screen.dart';
import 'package:lockin/features/personalization/presentation/pages/main_settings_screen.dart';
import 'package:lockin/features/vault/presentation/pages/vault_screen.dart';
import 'package:lockin/navigation/navigation_main_wrapper.dart';
import 'package:lockin/routing/routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final goRouter = GoRouter(
  initialLocation: AppRoutes.signUp,
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics:
      true, //TODO : ensure to remove this part of the code when you are done with the routes
  routes: [
    GoRoute(
      path: AppRoutes.signUp,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: AppRoutes.signIn,
      builder: (context, state) => const SignInScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return NavigationMainWrapper(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.vault,
              builder: (context, state) => const VaultScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.managePasswords,
              builder: (context, state) => const ManagePasswordScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.settings,
              builder: (context, state) => const MainSettingsScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
