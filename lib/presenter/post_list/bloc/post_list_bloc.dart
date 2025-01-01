import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_take_home/domain/use_cases/get_post_by_friend_use_case.dart';

import 'post_list_bloc_event.dart';
import 'post_list_bloc_state.dart';

class PostListBloc extends Bloc<PostListBlocEvent, PostListBlocState> {
  final GetPostByFriendUseCase _getPostByFriend;

  PostListBloc({
    required GetPostByFriendUseCase getPostByFriend,
  })  : _getPostByFriend = getPostByFriend,
        super(
          const PostListBlocState(),
        ) {
    on<GetPostsByUser>((event, emit) => _getPostByUserStream(event, emit));
  }

  void _getPostByUserStream(
    GetPostsByUser event,
    Emitter<PostListBlocState> emit,
  ) async {
    try {
      emit(
        state.copyWith(status: PostListBlocResult.loading),
      );

      final posts = await _getPostByFriend.execute(event.userId);
      emit(
        state.copyWith(
          status: PostListBlocResult.postsDataRetrieved,
          posts: posts,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
      emit(
        state.copyWith(
          status: PostListBlocResult.error,
          error: e.toString(),
        ),
      );
    }
  }
}
