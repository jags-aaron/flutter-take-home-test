import 'package:flutter_take_home/data/models/user_model.dart';
import 'package:flutter_take_home/domain/entities/user.dart';
import 'package:flutter_take_home/mock/mock_utils.dart';

abstract class UserRemoteSource {
  Future<User> getUserData();
}

class UserRemoteSourceImp implements UserRemoteSource {
  @override
  Future<User> getUserData() async {
    final (image, thumbnail) = MockUtils.randomImage();
    return UserModel(
        id: '9999',
        name: MockUtils.randomName(),
        email: MockUtils.randomEmail(),
        photoUrl: image,
        thumbnailUrl: thumbnail,
        friends: [
          ...List.generate(
            10,
            (index) => '${index + 1}',
          ),
        ],
        posts: [
          "1",
          "2",
          "3",
          "4",
        ]);
  }
}
