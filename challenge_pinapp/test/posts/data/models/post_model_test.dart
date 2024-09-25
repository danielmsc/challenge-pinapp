import 'package:challenge_pinapp/posts/data/models/post_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Map<String, dynamic> json;

  setUp(() {
    json = {
      "userId": 1,
      "id": 1,
      "title":
          "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
      "body":
          "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
    };
  });

  test('Should parse a Post json', () {
    final postModel = PostModel.fromJson(json);

    expect(postModel, isA<PostModel>());
  });
}
