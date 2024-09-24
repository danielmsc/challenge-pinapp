import 'package:challenge_pinapp/comments/domain/entities/comment.dart';
import 'package:challenge_pinapp/core/domain/entities/failures.dart';
import 'package:dartz/dartz.dart';

abstract class CommentsRepository {
  Future<Either<Failure, List<Comment>>> getComments(int postId);
}
