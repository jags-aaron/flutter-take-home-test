import 'package:flutter/material.dart';
import 'package:flutter_take_home/presenter/profile/entry_route.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

abstract class AppRouter {
  GoRouter get routerConfig;
}

class GoRouterNavigation extends AppRouter {
  static AppRouter of(BuildContext context, {bool listen = false}) =>
      Provider.of<AppRouter>(
        context,
        listen: listen,
      );

  @override
  final routerConfig = GoRouter(
    initialLocation: ProfileRoute.routePath,
    routes: _appRoutes,
    debugLogDiagnostics: true,
  );

  static get _appRoutes => [
        ProfileRoute(),
      ];
}
