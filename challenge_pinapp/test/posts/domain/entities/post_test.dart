import 'package:challenge_pinapp/posts/domain/entities/post.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should be an instance of Post', () {
    final post = Post(id: 1, userId: 1, body: 'body', title: 'title');

    expect(post, isA<Post>());
    expect(post.id, 1);
  });
}
