class PostListBlocEvent {}

class InitialEvent extends PostListBlocEvent {}
class GetPostsByUser extends PostListBlocEvent {
  final String userId;

  GetPostsByUser(this.userId);
}