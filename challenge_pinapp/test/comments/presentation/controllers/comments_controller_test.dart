import 'package:challenge_pinapp/comments/domain/entities/comment.dart';
import 'package:challenge_pinapp/comments/domain/use_cases/get_comments.dart';
import 'package:challenge_pinapp/comments/presentation/controllers/comments_controller.dart';
import 'package:challenge_pinapp/core/domain/entities/failures.dart';
import 'package:challenge_pinapp/core/presentation/controllers/content_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'comments_controller_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetComments>()])
void main() {
  late MockGetComments getCommentsUseCase;
  late CommentsController controller;
  const postId = 1;

  setUp(() {
    getCommentsUseCase = MockGetComments();
    controller = CommentsController(getCommentsUseCase: getCommentsUseCase);
    controller.postId = postId;
    controller.content = ContentController();
  });

  test('Should get the list of comments from the use case', () async {
    final comment = Comment(name: 'name', email: 'email', body: 'body');

    when(getCommentsUseCase(any)).thenAnswer((_) async => Right([comment]));

    final result =
        await controller.getCommentsUseCase(ParamsGetComments(postId: postId));

    result.fold((_) => null, (posts) => expect(posts, isA<List<Comment>>()));
  });

  test('Should not get the list of comments from the use case', () async {
    when(getCommentsUseCase.call(any))
        .thenAnswer((_) async => Left(NetworkFailure()));

    final result = await controller.getCommentsUseCase
        .call(ParamsGetComments(postId: postId));

    result.fold(
        (failure) => expect(failure, isA<NetworkFailure>()), (_) => null);
  });

  test('Should execute the getComments method successfully', () async {
    final comment = Comment(name: 'name', email: 'email', body: 'body');

    when(getCommentsUseCase(any)).thenAnswer((_) async => Right([comment]));

    await controller.getComments();

    expect(controller.comments.length, 1);
  });
}
