import 'package:challenge_pinapp/core/domain/entities/failures.dart';
import 'package:challenge_pinapp/posts/domain/entities/post.dart';
import 'package:dartz/dartz.dart';

abstract class PostsRepository {
  Future<Either<Failure, List<Post>>> getPosts();
}
