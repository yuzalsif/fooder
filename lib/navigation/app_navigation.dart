import 'package:flutter/material.dart';
import 'package:fooderlich/home.dart';
import 'package:fooderlich/models/app_state_manager.dart';
import 'package:fooderlich/screens/screens.dart';
import 'package:fooderlich/webview/raywenderlich_web_view.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  final AppStateManager appStateManager;

  AppNavigation(this.appStateManager);

  late final router = GoRouter(
    // initialLocation: '/profile',
    refreshListenable: appStateManager,
    urlPathStrategy: UrlPathStrategy.path,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        pageBuilder: (context, state) => const MaterialPage(
          child: Home(),
        ),
        routes: [
          GoRoute(
            path: 'items',
            name: 'items',
            pageBuilder: (context, state) => const MaterialPage(
              child: GroceryItemScreen(),
            ),
          ),
          GoRoute(
            path: 'profile',
            name: 'profile',
            pageBuilder: (context, state) => const MaterialPage(
              child: ProfileScreen(),
            ),
            routes: [
              GoRoute(
                path: 'raywenderlich',
                name: 'raywenderlich',
                pageBuilder: (context, state) => const MaterialPage(
                  child: RaywenderlichWebView(),
                ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        pageBuilder: (context, state) => const MaterialPage(
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        pageBuilder: (context, state) => const MaterialPage(
          child: OnBoardingScreen(),
        ),
      ),
      GoRoute(
        path: '/splash',
        name: 'splash',
        pageBuilder: (context, state) => const MaterialPage(
          child: SplashScreen(),
        ),
      )
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: Scaffold(
        body: Center(
          child: Text(state.error.toString()),
        ),
      ),
    ),
    redirect: (state) {
      final loggedIn = appStateManager.isLoggedIn;

      final islogging = state.subloc == '/login';

      final isInitializing = state.subloc == '/splash';

      final initialized = appStateManager.isInitialized;

      final completedonboarding = appStateManager.isOnboardingComplete;

      final initializableLoc =
          (state.subloc == '/' || state.subloc == '/profile');

      // bundle the location user is coming from in a query parameter
      final fromp = state.subloc == '/splash' ? '' : '?from=${state.subloc}';

      // try to avoid a page refresh to show the splash screen and allow the logout buton only
      final fromp1 = appStateManager.refreshFromLogout ? '' : fromp;

      if (!initialized) {
        if (fromp1 != '') {
          return null;
        } else {
          return initializableLoc ? '/splash' : null;
        }
      } else if (isInitializing) {
        // if the user is not logged in, they need to login
        if (!loggedIn) return islogging ? null : '/login$fromp';
      } else if (islogging && loggedIn) {
        // if user is logged in then direct them to where they where going and
        // return none if they where going nowhere.
        return state.queryParams.containsKey('from')
            ? state.queryParams['from']!
            : '';
      } else if (loggedIn && !completedonboarding) {
        // if the user is logged in but still on the login page, send them to
        // the onboarding screen
        return state.subloc == '/onboarding' ? null : '/onboarding';
      } else if (completedonboarding) {
        return state.subloc == '/onboarding' ? '/' : null;
      }
      return null;
    },
  );
}
