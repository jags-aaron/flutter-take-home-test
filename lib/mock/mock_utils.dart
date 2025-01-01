import 'dart:math';

import 'package:flutter_take_home/data/models/post_model.dart';
import 'package:flutter_take_home/data/models/user_model.dart';
import 'package:random_name_generator/random_name_generator.dart';

final mockListOfFriends = List.generate(
  20, (index) {
    final (image, thumbnail) = MockUtils.randomImage();
    return UserModel(
      id: index.toString(),
      name: MockUtils.randomName(),
      email: MockUtils.randomEmail(),
      photoUrl: image,
      thumbnailUrl: thumbnail,
      friends: [],
      posts: [],
    );
  },
);

final Map<Zone, String> mockZoneMap = {
  Zone.france: 'france',
  Zone.spain: 'spain',
  Zone.us: 'us',
  Zone.germany: 'germany',
  Zone.canada: 'canada',
  Zone.brazil: 'brazil',
  Zone.italy: 'italy',
  Zone.japan: 'japan',
  Zone.poland: 'poland',
  Zone.russia: 'russia',
  Zone.southAfrica: 'southAfrica',
  Zone.switzerland: 'switzerland',
};

class MockUtils {
  //generate function to return a randoom image to pichsum
  //https://picsum.photos/200/300
  static (String, String) randomImage({int width = 720, int height = 1024}) {
    final randomValue = Random().nextInt(100);
    return (
      "https://picsum.photos/$width/$height?random=$randomValue",
      "https://picsum.photos/300/300?random=$randomValue",
    );
  }

  static int randomValues() {
    final random = Random();
    return random.nextInt(1000);
  }

  static String randomEmail() {
    final random = Random();
    return '${randomName()}${random.nextInt(1000)}@${randomSurname()}.com'
        .toLowerCase()
        .trim();
  }

  static String randomName() {
    final random = Random();
    return RandomNames(
            mockZoneMap.keys.elementAt(random.nextInt(mockZoneMap.keys.length)))
        .name();
  }

  static String randomSurname() {
    final random = Random();
    return RandomNames(
            mockZoneMap.keys.elementAt(random.nextInt(mockZoneMap.keys.length)))
        .surname();
  }
}
