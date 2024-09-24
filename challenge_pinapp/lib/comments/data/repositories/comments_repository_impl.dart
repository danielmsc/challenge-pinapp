import 'package:challenge_pinapp/comments/data/data_sources/comments_data_source.dart';
import 'package:challenge_pinapp/comments/domain/entities/comment.dart';
import 'package:challenge_pinapp/comments/domain/repositories/comments_repository.dart';
import 'package:challenge_pinapp/core/domain/api_network.dart';
import 'package:challenge_pinapp/core/domain/entities/failures.dart';
import 'package:dartz/dartz.dart';

class CommentsRepositoryImpl extends CommentsRepository {
  final CommentsDataSource dataSource;

  CommentsRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<Comment>>> getComments(int postId) async {
    return await ApiNetwork.call(
        () async => await dataSource.getComments(postId));
  }
}
