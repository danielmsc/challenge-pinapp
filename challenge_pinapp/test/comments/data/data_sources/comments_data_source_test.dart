import 'package:challenge_pinapp/comments/data/models/comment_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../posts/data/data_sources/posts_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
void main() {
  late MockDio client;
  const path = 'https://jsonplaceholder.typicode.com/comments';
  const params = {'postId': 1};

  setUp(() {
    client = MockDio();
  });

  test('Should return a list of comments', () async {
    when(client.get(path, queryParameters: params)).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(),
        statusCode: 200,
        data: [
          {
            "postId": 1,
            "id": 1,
            "name": "id labore ex et quam laborum",
            "email": "Eliseo@gardner.biz",
            "body":
                "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"
          },
        ],
      ),
    );

    final response = await client.get(path, queryParameters: params);
    final comments =
        (response.data as List).map((e) => CommentModel.fromJson(e)).toList();

    expect(comments, isA<List<CommentModel>>());
  });

  test('Should throw a DioException', () async {
    when(client.get(path, queryParameters: params))
        .thenThrow(DioException(requestOptions: RequestOptions()));

    expect(() async => await client.get(path, queryParameters: params),
        throwsA(isA<DioException>()));
  });
}
