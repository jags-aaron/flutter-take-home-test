import 'package:flutter_take_home/domain/entities/post.dart';

abstract class PostRepository {
  Future<Post> getPostDetails(String postId);
  Future<List<Post>> getPostsByFriend(String friend);
}
