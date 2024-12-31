import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_take_home/app_config/theme_data.dart';
import 'package:flutter_take_home/app_router.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        Provider<AppRouter>.value(
          value: GoRouterNavigation(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            theme: themeData(),
            routerConfig: GoRouterNavigation.of(context).routerConfig,
          );
        }
      ),
    );
  }
}
