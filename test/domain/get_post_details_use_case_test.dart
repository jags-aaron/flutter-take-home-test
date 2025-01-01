import 'dart:convert';

import 'package:flutter_take_home/data/models/post_model.dart';
import 'package:flutter_take_home/data/repositories/post_repository.dart';
import 'package:flutter_take_home/domain/use_cases/get_post_detail_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../data/fixtures/fixture_reader.dart';

class MockRepository extends Mock implements PostRepository {}

void main() {
  late GetPostDetailsUseCase useCase;
  late MockRepository repository;
  const anyString = 'anyString';

  final mockResponse = fixture('post_response.json');
  final post = PostModelList.fromJson(
    jsonDecode(
      mockResponse,
    ),
  ).posts[0];

  setUp(() {
    repository = MockRepository();
    useCase = GetPostDetailsUseCase(
      repository: repository,
    );
  });

  final globalException = Exception('Failed to make request to endpoint');

  test('Should return expected result when repository makes success request',
      () async {
    when(() => repository.getPostDetails(anyString))
        .thenAnswer((_) => Future.value(post));

    expect(await useCase.execute(anyString), post);
  });

  test('Should return an exception when repository fail to make a request', () {
    when(() => repository.getPostDetails(anyString))
        .thenThrow(globalException);

    expect(() => useCase.execute(anyString), throwsException);
  });
}
