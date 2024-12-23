import 'package:ch_seven/models/app_state_manager.dart';
import 'package:ch_seven/models/grocery_manager.dart';
import 'package:ch_seven/models/profile_manager.dart';
import 'package:ch_seven/screens/login_screen.dart';
import 'package:ch_seven/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final AppStateManager appStateManager;
  final ProfileManager profileManager;
  final GroceryManager groceryManager;

  AppRouter(
    this.appStateManager,
    this.profileManager,
    this.groceryManager,
  );

  late final router = GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: appStateManager,
    initialLocation: '/login',
    routes: [
      GoRoute(
        name: 'login',
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: 'onboarding',
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Text(state.error.toString()),
          ),
        ),
      );
    },
    redirect: (context, GoRouterState state) {
      final loggedIn = appStateManager.isLoggedIn;
      final loggingIn =  state.matchedLocation == '/login';
      if (!loggedIn) return loggingIn ? null : '/login';
      final isOnboardingComplete = appStateManager.isOnboardingComplete;
      final onboarding = state.matchedLocation == '/onboarding';
      if (!isOnboardingComplete) {
        return onboarding ? null : '/onboarding';
      }
      if (loggingIn || onboarding) return '/${FooderlichTab.explore}';
      
      return null;
    }
  );
}
