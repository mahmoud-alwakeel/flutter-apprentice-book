import 'package:ch_seven/models/app_state_manager.dart';
import 'package:ch_seven/models/grocery_manager.dart';
import 'package:ch_seven/models/profile_manager.dart';
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
    routes: [],
  );
}
