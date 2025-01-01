import 'dart:convert';

import 'package:flutter_take_home/data/models/post_model.dart';
import 'package:flutter_take_home/data/repositories/post_repository.dart';
import 'package:flutter_take_home/data/sources/post_remote_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../fixtures/fixture_reader.dart';

class MockPostRemoteSource extends Mock implements PostRemoteSource {}

void main() {
  late PostRemoteSource remoteSource;
  late PostRepositoryImp repository;
  const anyString = 'anyString';

  setUp(() {
    remoteSource = MockPostRemoteSource();
    repository = PostRepositoryImp(
      postRemoteSource: remoteSource,
    );
  });

  final mockResponse = fixture('post_response.json');

  group(
    'getPostDetails',
    () {
      test('returns post list when succeeds', () async {
        final responseModel = PostModelList.fromJson(
          jsonDecode(
            mockResponse,
          ),
        );

        when(() => remoteSource.getPostDetails(anyString))
            .thenAnswer((_) async => responseModel.posts.first);

        final actual = await repository.getPostDetails(anyString);

        verify(() => remoteSource.getPostDetails(anyString));
        expect(actual, responseModel.posts.first);
      });

      test(
        'returns error when Exception',
        () async {
          when(() => remoteSource.getPostDetails(anyString))
              .thenThrow(Exception());

          final actual = repository.getPostDetails(anyString);
          expect(actual, throwsA(isInstanceOf<Exception>()));
        },
      );
    },
  );
}
