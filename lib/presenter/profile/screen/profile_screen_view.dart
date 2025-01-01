import 'package:flutter/material.dart';
import 'profile_screen_model.dart';

class ProfileScreenView extends StatelessWidget {
  const ProfileScreenView({
    super.key,
    required ProfileScreenModel model,
  }) : _model = model;

  final ProfileScreenModel _model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_model.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  CircleAvatar(
                    maxRadius: 50,
                    backgroundImage: NetworkImage(
                      _model.userData?.photoUrl ??
                          'https://picsum.photos/200/300',
                    ),
                  ),
                  Text('Hello ${_model.userData?.name} !!'),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                // TODO Inherit App Style
                _model.friendListTitle,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Column(
                children: [
                  ..._model.friends.map(
                    (friend) => ListTile(
                      title: Text(
                        friend.name,
                      ),
                      subtitle: Text(
                        friend.email,
                      ),
                      trailing: CircleAvatar(
                        backgroundImage: NetworkImage(
                          friend.thumbnailUrl,
                        ),
                      ),
                      onTap: () => _model.onFriendSelected(
                        friend,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
