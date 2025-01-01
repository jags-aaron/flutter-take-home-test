import 'package:flutter_take_home/data/sources/user_remote_source.dart';
import 'package:flutter_take_home/domain/entities/user.dart';

abstract class UserRepository {
  Future<User> getUserData();
}

class UserRepositoryImp implements UserRepository {
  UserRepositoryImp({
    required UserRemoteSource userRemoteSource,
  }) : _userRemoteSource = userRemoteSource;

  final UserRemoteSource _userRemoteSource;

  @override
  Future<User> getUserData() async {
    try {
      return _userRemoteSource.getUserData();
    } catch (e) {
      rethrow;
    }
  }
}
