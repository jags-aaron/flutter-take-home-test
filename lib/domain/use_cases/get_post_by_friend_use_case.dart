import 'package:flutter_take_home/data/repositories/post_repository.dart';
import 'package:flutter_take_home/domain/entities/post.dart';

class GetPostByFriendUseCase {
  GetPostByFriendUseCase({
    required PostRepository repository,
  }) : _repository = repository;

  final PostRepository _repository;

  Future<List<Post>> execute(String friendId) {
    return _repository.getPostsByFriend(friendId);
  }
}
