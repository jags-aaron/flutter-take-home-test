import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_take_home/domain/entities/user.dart';
import 'package:flutter_take_home/presenter/post_list/bloc/post_list_bloc_event.dart';
import '../bloc/post_list_bloc.dart';
import '../bloc/post_list_bloc_state.dart';
import 'post_list_screen_view.dart';
import 'post_list_screen_model.dart';

class PostListScreenController extends StatelessWidget {
  const PostListScreenController({
    Key? key,
    required String userId,
    required User friend,
  })  : _userId = userId,
        _friend = friend,
        super(key: key);

  final String _userId;
  final User _friend;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PostListBloc>()
      ..add(GetPostsByUser(
        _userId,
      ));

    return BlocBuilder<PostListBloc, PostListBlocState>(
      bloc: bloc,
      builder: (context, state) {
        if (state.status == PostListBlocResult.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        return ProfileScreenView(
          model: PostListScreenModel.build(
            title: '${_friend.name}\'s Posts',
            posts: state.posts ?? [],
            onPostSelected: (postId) {
              // TODO
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Column(
                  children: [
                    Text('(Post $postId selected)'),
                    Text('TODO: Navigate to post detail screen'),
                  ],
                ),
              ));
            },
          ),
        );
      },
    );
  }
}
