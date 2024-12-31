import 'dart:convert';

import 'package:flutter_take_home/data/models/post_model.dart';
import 'package:flutter_take_home/domain/entities/post.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/fixture_reader.dart';

void main() {
  test('Should return PostModel correctly',
      () async {
        final mockResponse = fixture('post_response.json');
        final userModel = PostModelList.fromJson(
          jsonDecode(
            mockResponse,
          ),
        );

        expect(userModel, isA<PostModelList>());
      });

  test('Should return Post correctly',
      () async {
        final mockResponse = fixture('post_response.json');
        final postModelList = PostModelList.fromJson(
          jsonDecode(
            mockResponse,
          ),
        );

        expect(postModelList.posts[0], isA<PostModel>());
        expect(postModelList.posts[0], isA<Post>());
      });
}