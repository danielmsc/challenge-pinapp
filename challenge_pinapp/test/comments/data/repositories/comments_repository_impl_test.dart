import 'package:challenge_pinapp/comments/data/data_sources/comments_data_source.dart';
import 'package:challenge_pinapp/comments/data/models/comment_model.dart';
import 'package:challenge_pinapp/comments/data/repositories/comments_repository_impl.dart';
import 'package:challenge_pinapp/comments/domain/entities/comment.dart';
import 'package:challenge_pinapp/comments/domain/repositories/comments_repository.dart';
import 'package:challenge_pinapp/core/data/network/exceptions.dart';
import 'package:challenge_pinapp/core/domain/entities/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'comments_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CommentsDataSource>()])
void main() {
  late MockCommentsDataSource dataSource;
  late CommentsRepository repository;
  const postId = 1;

  setUp(() {
    dataSource = MockCommentsDataSource();
    repository = CommentsRepositoryImpl(dataSource: dataSource);
  });

  test('Should return a Right<List<Comment>>', () async {
    final comment = CommentModel(name: 'name', email: 'email', body: 'body');

    when(dataSource.getComments(postId)).thenAnswer((_) async => [comment]);

    final result = await repository.getComments(postId);

    expect(result, isA<Right<Failure, List<Comment>>>());

    result.fold((_) => null, (comments) => expect(comments[0].body, 'body'));
  });

  test('Should return a Failure', () async {
    when(dataSource.getComments(postId)).thenThrow(NetworkException());

    final result = await repository.getComments(postId);

    expect(result, isA<Left<Failure, List<Comment>>>());
  });
}
