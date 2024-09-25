import 'package:challenge_pinapp/comments/domain/entities/comment.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should be an instance of Comment', () {
    final comment = Comment(name: 'name', email: 'email', body: 'body');

    expect(comment, isA<Comment>());
    expect(comment.name, 'name');
  });
}
