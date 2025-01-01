import 'package:flutter_take_home/domain/entities/user.dart';

abstract class UserRepository {
  Future<User> getUserData();
}
