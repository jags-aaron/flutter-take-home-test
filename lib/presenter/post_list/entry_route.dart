import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_take_home/data/repositories/post_repository.dart';
import 'package:flutter_take_home/data/sources/post_remote_source.dart';
import 'package:flutter_take_home/domain/entities/user.dart';
import 'package:flutter_take_home/domain/use_cases/get_post_by_friend_use_case.dart';
import 'package:flutter_take_home/presenter/post_list/bloc/post_list_bloc.dart';
import 'package:flutter_take_home/presenter/post_list/screen/post_list_screen_controller.dart';
import 'package:go_router/go_router.dart';

class PostListRoute extends GoRoute {
  static const routePath = '/postList';

  PostListRoute()
      : super(
          path: '$routePath/:userId',
          builder: (BuildContext context, GoRouterState state) {
            final userId = state.pathParameters['userId']!;
            final extraData = state.extra as Map<String, User>;
            return BlocProvider(
              create: (context) => PostListBloc(
                getPostByFriend: GetPostByFriendUseCase(
                  repository: PostRepositoryImp(
                    postRemoteSource: PostRemoteSourceImp(),
                  ),
                ),
              ),
              child: PostListScreenController(
                userId: userId,
                friend: extraData['friend']!,
              ),
            );
          },
        );
}
