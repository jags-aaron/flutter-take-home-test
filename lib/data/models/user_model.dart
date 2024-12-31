import 'package:flutter_take_home/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.photoUrl,
    required super.thumbnailUrl,
    required super.friends,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    List<User> friends = [];
    if(json['friends'] != null) {
      for (var friend in json['friends']) {
        friends.add(UserModel.fromJson(friend));
      }
    }

    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      photoUrl: json['photoUrl'],
      thumbnailUrl: json['thumbnailUrl'],
      friends: friends,
    );
  }
}
