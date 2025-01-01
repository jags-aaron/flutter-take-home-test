import 'package:flutter_take_home/data/sources/post_remote_source.dart';
import 'package:flutter_take_home/domain/entities/post.dart';

abstract class PostRepository {
  Future<Post> getPostDetails(String postId);

  Future<List<Post>> getPostsByFriend(String friend);
}

class PostRepositoryImp implements PostRepository {
  PostRepositoryImp({required PostRemoteSource postRemoteSource})
      : _postRemoteSource = postRemoteSource;

  final PostRemoteSource _postRemoteSource;

  @override
  Future<Post> getPostDetails(String postId) async {
    try {
      return _postRemoteSource.getPostDetails(postId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Post>> getPostsByFriend(String friend) async {
    try {
      return _postRemoteSource.getPostsByFriend(friend);
    } catch (e) {
      rethrow;
    }
  }
}
