import 'package:challenge_pinapp/comments/data/models/comment_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Map<String, dynamic> json;

  setUp(() {
    json = {
      "postId": 1,
      "id": 1,
      "name": "id labore ex et quam laborum",
      "email": "Eliseo@gardner.biz",
      "body":
          "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"
    };
  });

  test('Should parse a Comment json', () {
    final commentModel = CommentModel.fromJson(json);

    expect(commentModel, isA<CommentModel>());
  });
}
