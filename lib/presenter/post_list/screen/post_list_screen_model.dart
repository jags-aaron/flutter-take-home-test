import 'package:equatable/equatable.dart';
import 'package:flutter_take_home/domain/entities/post.dart';
import 'package:flutter_take_home/domain/entities/user.dart';

class PostListScreenModel extends Equatable {
  const PostListScreenModel._({
    required this.title,
    required this.posts,
    required this.onPostSelected,
  });

  factory PostListScreenModel.build({
    required String title,
    required List<Post> posts,
    required Function(String) onPostSelected,
  }) {
    return PostListScreenModel._(
      title: title,
      posts: posts,
      onPostSelected: onPostSelected,
    );
  }

  final String title;
  final List<Post> posts;
  final Function(String) onPostSelected;

  @override
  List<Object?> get props => [
        title,
        posts,
        onPostSelected,
      ];
}
