import 'package:challenge_pinapp/comments/data/models/comment_model.dart';
import 'package:challenge_pinapp/core/data/network/dio_client.dart';

abstract class CommentsDataSource {
  Future<List<CommentModel>> getComments(int postId);
}

class CommentsDataSourceImpl extends CommentsDataSource {
  final DioClient client;

  CommentsDataSourceImpl({required this.client});

  @override
  Future<List<CommentModel>> getComments(int postId) async {
    final response = client.get('/comments', params: {'postId': postId});
    return (response as List).map((e) => CommentModel.fromJson(e)).toList();
  }
}
