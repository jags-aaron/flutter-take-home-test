import 'dart:convert';

import 'package:flutter_take_home/data/models/user_model.dart';
import 'package:flutter_take_home/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/fixture_reader.dart';

void main() {
  test('Should return User Model correctly',
      () async {
        final mockResponse = fixture('user_response.json');
        final userModel = UserModel.fromJson(
          jsonDecode(
            mockResponse,
          ),
        );

        expect(userModel, isA<UserModel>());
        expect(userModel, isA<User>());
      });
}