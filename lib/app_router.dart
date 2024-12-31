import 'package:flutter/material.dart';
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
    initialLocation: '/',
    routes: _appRoutes,
    debugLogDiagnostics: true,
  );

  static get _appRoutes => [
        GoRoute(
          path: '/',
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Profiles'),
              ),
              body: const SafeArea(
                child: Center(
                  child: Text('Hello :)'),
                ),
              ),
            );
          },
        )
      ];
}
