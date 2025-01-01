import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_take_home/presenter/post_list/entry_route.dart';
import 'package:flutter_take_home/presenter/profile/bloc/profile_bloc_event.dart';
import 'package:flutter_take_home/presenter/profile/entry_route.dart';
import 'package:go_router/go_router.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_bloc_state.dart';
import 'profile_screen_view.dart';
import 'profile_screen_model.dart';

class ProfileScreenController extends StatelessWidget {
  const ProfileScreenController({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProfileBloc>()..add(GetUserDataEvent());

    return BlocConsumer<ProfileBloc, ProfileBlocState>(
      bloc: bloc,
      listener: (context, state) {
        // TODO
      },
      builder: (context, state) {
        if (state.status == ProfileBlocResult.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        return ProfileScreenView(
          model: ProfileScreenModel.build(
            title: 'Profile',
            friends: state.user?.friends ?? [],
            onFriendSelected: (friend) {
              context.push(
                '${PostListRoute.routePath}/${friend.id}',
                extra: {'friend': friend},
              );
            },
            userData: state.user,
            friendListTitle: 'List of Friends',
          ),
        );
      },
    );
  }
}
