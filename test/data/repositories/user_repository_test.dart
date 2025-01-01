import 'dart:convert';

import 'package:flutter_take_home/data/models/user_model.dart';
import 'package:flutter_take_home/data/repositories/user_repository.dart';
import 'package:flutter_take_home/data/sources/user_remote_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../fixtures/fixture_reader.dart';

class MockUserRemoteSource extends Mock implements UserRemoteSource {}

void main() {
  late UserRemoteSource remoteSource;
  late UserRepositoryImp repository;

  setUp(() {
    remoteSource = MockUserRemoteSource();
    repository = UserRepositoryImp(
      userRemoteSource: remoteSource,
    );
  });

  final mockResponse = fixture('user_response.json');

  group(
    'getUserData',
    () {
      test('returns user data when succeeds', () async {
        final responseModel = UserModel.fromJson(
          jsonDecode(
            mockResponse,
          ),
        );

        when(() => remoteSource.getUserData())
            .thenAnswer((_) async => responseModel);

        final actual = await repository.getUserData();

        verify(() => remoteSource.getUserData());
        expect(actual, responseModel);
      });

      test(
        'returns error when Exception',
        () async {
          when(() => remoteSource.getUserData())
              .thenThrow(Exception());

          final actual = repository.getUserData();
          expect(actual, throwsA(isInstanceOf<Exception>()));
        },
      );
    },
  );
}
