import 'package:flutter_take_home/data/repositories/post_repository.dart';
import 'package:flutter_take_home/domain/entities/post.dart';

class GetPostDetailsUseCase {
  GetPostDetailsUseCase({
    required PostRepository repository,
  }) : _repository = repository;

  final PostRepository _repository;

  Future<Post> execute(String postId) {
    return _repository.getPostDetails(postId);
  }
}
