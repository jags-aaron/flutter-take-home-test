import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_take_home/data/repositories/user_repository.dart';
import 'package:flutter_take_home/data/sources/user_remote_source.dart';
import 'package:flutter_take_home/domain/use_cases/get_user_data_use_case.dart';
import 'package:flutter_take_home/presenter/profile/bloc/profile_bloc.dart';
import 'package:flutter_take_home/presenter/profile/screen/profile_screen_controller.dart';
import 'package:go_router/go_router.dart';

class ProfileRoute extends GoRoute {
  static const routePath = '/profile';

  ProfileRoute()
      : super(
          path: routePath,
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              create: (context) => ProfileBloc(
                getUserData: GetUserDataUseCase(
                  repository: UserRepositoryImp(
                    userRemoteSource: UserRemoteSourceImp(),
                  ),
                ),
              ),
              child: const ProfileScreenController(),
            );
          },
          routes: <RouteBase>[
            // TODO: Add child routes here
          ],
        );
}
