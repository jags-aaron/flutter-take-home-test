import 'package:flutter/material.dart';
import 'post_list_screen_model.dart';

class ProfileScreenView extends StatelessWidget {
  const ProfileScreenView({
    super.key,
    required PostListScreenModel model,
  }) : _model = model;

  final PostListScreenModel _model;

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
                  ..._model.posts.map(
                    (post) => ListTile(
                      title: Text(
                        post.title,
                      ),
                      subtitle: Text(
                        post.description,
                      ),
                      trailing: CircleAvatar(
                        backgroundImage: NetworkImage(
                          post.thumbnailUrl,
                        ),
                      ),
                      onTap: () => _model.onPostSelected(
                        post.id,
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
