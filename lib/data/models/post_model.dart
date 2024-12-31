import 'package:flutter_take_home/domain/entities/post.dart';

class PostModelList {
  final List<PostModel> posts;

  PostModelList({
    required this.posts,
  });

  factory PostModelList.fromJson(List<dynamic> json) {
    return PostModelList(
      posts: json.map((i) => PostModel.fromJson(i)).toList(),
    );
  }
}

class PostModel extends Post {
  PostModel({
    required super.id,
    required super.title,
    required super.description,
    required super.imageUrl,
    required super.thumbnailUrl,
    required super.postedBy,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      thumbnailUrl: json['thumbnailUrl'],
      postedBy: json['postedBy'],
    );
  }

}