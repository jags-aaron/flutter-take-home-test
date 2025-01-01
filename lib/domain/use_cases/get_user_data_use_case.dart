import 'package:flutter_take_home/data/repositories/user_repository.dart';
import 'package:flutter_take_home/domain/entities/user.dart';

class GetUserDataUseCase {
  GetUserDataUseCase({
    required UserRepository repository,
  }) : _repository = repository;

  final UserRepository _repository;

  Future<User> execute() {
    return _repository.getUserData();
  }
}
