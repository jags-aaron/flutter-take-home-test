class User {
  final String id;
  final String name;
  final String email;
  final String photoUrl;
  final String thumbnailUrl;
  final List<String> posts;
  final List<String> friends;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.thumbnailUrl,
    required this.posts,
    required this.friends,
  });
}