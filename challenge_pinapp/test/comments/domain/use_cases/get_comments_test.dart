import 'package:challenge_pinapp/comments/domain/entities/comment.dart';
import 'package:challenge_pinapp/comments/domain/repositories/comments_repository.dart';
import 'package:challenge_pinapp/comments/domain/use_cases/get_comments.dart';
import 'package:challenge_pinapp/core/domain/entities/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_comments_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CommentsRepository>()])
void main() {
  late MockCommentsRepository repository;
  late GetComments getCommentsUseCase;
  const postId = 1;

  setUp(() {
    repository = MockCommentsRepository();
    getCommentsUseCase = GetComments(repository: repository);
  });

  test('Should return a list of comments (Right)', () async {
    final comment = Comment(name: 'name', email: 'email', body: 'body');

    when(repository.getComments(postId))
        .thenAnswer((_) async => Right([comment]));

    final result = await getCommentsUseCase(ParamsGetComments(postId: postId));

    expect(result, isA<Right<Failure, List<Comment>>>());
  });

  test('Should return a Failure (Left)', () async {
    when(repository.getComments(postId))
        .thenAnswer((_) async => Left(NetworkFailure()));

    final result = await getCommentsUseCase(ParamsGetComments(postId: postId));

    expect(result, isA<Left<Failure, List<Comment>>>());
  });
}
