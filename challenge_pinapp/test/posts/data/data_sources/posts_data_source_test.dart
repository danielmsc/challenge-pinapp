import 'package:challenge_pinapp/posts/data/models/post_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'posts_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
void main() async {
  late MockDio client;
  const path = 'https://jsonplaceholder.typicode.com/posts';

  setUp(() {
    client = MockDio();
  });

  test('Should return a list of posts', () async {
    when(client.get(path)).thenAnswer(
      (_) async => Response(
        data: [
          {
            "userId": 1,
            "id": 1,
            "title":
                "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
            "body":
                "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
          },
        ],
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      ),
    );

    final response = await client.get(path);
    final posts =
        (response.data as List).map((e) => PostModel.fromJson(e)).toList();

    expect(posts, isA<List<PostModel>>());
  });

  test('Should throw a DioException', () async {
    when(client.get(path))
        .thenThrow(DioException(requestOptions: RequestOptions()));

    expect(() async => await client.get(path), throwsA(isA<DioException>()));
  });
}
