import 'package:equatable/equatable.dart';
import 'package:flutter_take_home/domain/entities/post.dart';

enum PostListBlocResult {
  initial,
  loading,
  error,
  postsDataRetrieved,
}

class PostListBlocState extends Equatable {
  const PostListBlocState({
    this.status = PostListBlocResult.initial,
    this.posts,
    this.error,
  });

  final PostListBlocResult? status;
  final List<Post>? posts;
  final String? error;

  @override
  List<Object?> get props => [
    status,
    posts,
    error,
  ];

  PostListBlocState copyWith({
    required PostListBlocResult status,
    List<Post>? posts,
    String? error,
  }) {
    return PostListBlocState(
      status: status,
      posts: posts ?? this.posts,
      error: error ?? this.error,
    );
  }
}
