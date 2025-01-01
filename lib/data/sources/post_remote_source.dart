import 'package:flutter_take_home/data/models/post_model.dart';
import 'package:flutter_take_home/domain/entities/post.dart';
import 'package:flutter_take_home/mock/mock_utils.dart';

abstract class PostRemoteSource {
  Future<Post> getPostDetails(String postId);

  Future<List<Post>> getPostsByFriend(String friend);
}

class PostRemoteSourceImp implements PostRemoteSource {
  final mockListOfPost = List.generate(
    20,
    (index) {
      final (image, thumbnail) = MockUtils.randomImage();
      return PostModel(
        id: index.toString(),
        title: 'Post $index',
        description: 'Description $index',
        imageUrl: image,
        thumbnailUrl: thumbnail,
        postedBy: 'User $index',
      );
    },
  );

  @override
  Future<Post> getPostDetails(String postId) async {
    return mockListOfPost.firstWhere(
      (element) => element.id == postId,
    );
  }

  @override
  Future<List<Post>> getPostsByFriend(String friend) async {
    return mockListOfPost;
  }
}
