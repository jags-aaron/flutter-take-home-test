import 'dart:convert';

import 'package:flutter_take_home/data/models/user_model.dart';
import 'package:flutter_take_home/data/repositories/user_repository.dart';
import 'package:flutter_take_home/domain/use_cases/get_user_data_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../data/fixtures/fixture_reader.dart';

class MockRepository extends Mock implements UserRepository {}

void main() {
  late GetUserDataUseCase useCase;
  late MockRepository repository;

  final mockResponse = fixture('user_response.json');
  final user = UserModel.fromJson(
    jsonDecode(
      mockResponse,
    ),
  );

  setUp(() {
    repository = MockRepository();
    useCase = GetUserDataUseCase(
      repository: repository,
    );
  });

  final globalException = Exception('Failed to make request to endpoint');

  test('Should return expected result when repository makes success request',
      () async {
    when(() => repository.getUserData())
        .thenAnswer((_) => Future.value(user));

    expect(await useCase.execute(), user);
  });

  test('Should return an exception when repository fail to make a request', () {
    when(() => repository.getUserData())
        .thenThrow(globalException);

    expect(() => useCase.execute(), throwsException);
  });
}
