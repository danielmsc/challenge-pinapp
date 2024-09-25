import 'package:challenge_pinapp/core/data/network/dio_client.dart';
import 'package:challenge_pinapp/posts/data/models/post_model.dart';

abstract class PostsDataSource {
  Future<List<PostModel>> getPosts();
}

class PostsDataSourceImpl implements PostsDataSource {
  final DioClient client;

  PostsDataSourceImpl({required this.client});

  @override
  Future<List<PostModel>> getPosts() async {
    final response = await client.get('/posts');
    return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
  }
}
