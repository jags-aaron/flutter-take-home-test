import 'dart:convert';

import 'package:flutter_take_home/data/models/post_model.dart';
import 'package:flutter_take_home/data/repositories/post_repository.dart';
import 'package:flutter_take_home/domain/use_cases/get_post_by_friend_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../data/fixtures/fixture_reader.dart';

class MockRepository extends Mock implements PostRepository {}

void main() {
  late GetPostByFriendUseCase useCase;
  late MockRepository repository;
  const anyString = 'anyString';

  final mockResponse = fixture('post_response.json');
  final postList = PostModelList.fromJson(
    jsonDecode(
      mockResponse,
    ),
  ).posts;

  setUp(() {
    repository = MockRepository();
    useCase = GetPostByFriendUseCase(
      repository: repository,
    );
  });

  final globalException = Exception('Failed to make request to endpoint');

  test('Should return expected result when repository makes success request',
      () async {
    when(() => repository.getPostsByFriend(anyString))
        .thenAnswer((_) => Future.value(postList));

    expect(await useCase.execute(anyString), postList);
  });

  test('Should return an exception when repository fail to make a request', () {
    when(() => repository.getPostsByFriend(anyString))
        .thenThrow(globalException);

    expect(() => useCase.execute(anyString), throwsException);
  });
}
