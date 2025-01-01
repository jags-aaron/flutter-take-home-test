import 'package:equatable/equatable.dart';
import 'package:flutter_take_home/domain/entities/user.dart';

class ProfileScreenModel extends Equatable {
  const ProfileScreenModel._({
    required this.title,
    required this.friendListTitle,
    required this.friends,
    required this.userData,
    required this.onFriendSelected,
  });

  factory ProfileScreenModel.build({
    required String title,
    required String friendListTitle,
    required User? userData,
    required List<User> friends,
    required Function(User) onFriendSelected,
  }) {
    return ProfileScreenModel._(
      title: title,
      friendListTitle: friendListTitle,
      userData: userData,
      friends: friends,
      onFriendSelected: onFriendSelected,
    );
  }

  final String title;
  final String friendListTitle;
  final User? userData;
  final List<User> friends;
  final Function(User) onFriendSelected;

  @override
  List<Object?> get props => [
        title,
        friendListTitle,
        userData,
        friends,
        onFriendSelected,
      ];
}
