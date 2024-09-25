import 'package:challenge_pinapp/core/presentation/controllers/content_controller.dart';
import 'package:challenge_pinapp/posts/domain/entities/post.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ContentController controller;
  const postId = 1;

  setUp(() {
    controller = ContentController();
    controller.posts.value = [
      Post(userId: 1, id: 1, title: 'title', body: 'body', liked: false)
    ];
  });

  test('Should check that the post is liked and then not liked', () {
    Post post = controller.posts.where((post) => post.id == postId).first;
    expect(post.liked, false);

    controller.flipPostLike(postId);
    post = controller.posts.where((post) => post.id == postId).first;
    expect(post.liked, true);

    controller.flipPostLike(postId);
    post = controller.posts.where((post) => post.id == postId).first;
    expect(post.liked, false);
  });
}
