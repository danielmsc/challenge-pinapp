import 'package:challenge_pinapp/comments/domain/entities/comment.dart';
import 'package:challenge_pinapp/comments/domain/repositories/comments_repository.dart';
import 'package:challenge_pinapp/core/domain/entities/failures.dart';
import 'package:challenge_pinapp/core/domain/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class GetComments extends UseCase<List<Comment>, ParamsGetComments> {
  final CommentsRepository repository;

  GetComments({required this.repository});

  @override
  Future<Either<Failure, List<Comment>>> call(ParamsGetComments params) async {
    return await repository.getComments(params.postId);
  }
}

class ParamsGetComments {
  final int postId;

  ParamsGetComments({required this.postId});
}
