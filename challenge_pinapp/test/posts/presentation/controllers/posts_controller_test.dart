import 'package:challenge_pinapp/core/domain/entities/failures.dart';
import 'package:challenge_pinapp/core/presentation/controllers/content_controller.dart';
import 'package:challenge_pinapp/posts/domain/entities/post.dart';
import 'package:challenge_pinapp/posts/domain/use_cases/get_posts.dart';
import 'package:challenge_pinapp/posts/presentation/controllers/posts_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'posts_controller_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetPosts>()])
void main() {
  late MockGetPosts getPostsUseCase;
  late PostsController controller;

  setUp(() {
    getPostsUseCase = MockGetPosts();
    controller = PostsController(getPostsUseCase: getPostsUseCase);
    controller.content = ContentController();
  });

  test('Should get the list of posts from the use case', () async {
    final post = Post(id: 1, userId: 1, title: 'title', body: 'body');

    when(getPostsUseCase(any)).thenAnswer((_) async => Right([post]));

    final result = await controller.getPostsUseCase(NoParamsGetPosts());

    result.fold((_) => null, (posts) => expect(posts, isA<List<Post>>()));
  });

  test('Should not get the list of posts from the use case', () async {
    when(getPostsUseCase.call(any))
        .thenAnswer((_) async => Left(NetworkFailure()));

    final result = await controller.getPostsUseCase.call(NoParamsGetPosts());

    result.fold(
        (failure) => expect(failure, isA<NetworkFailure>()), (_) => null);
  });

  test('Should execute the getPosts method successfully', () async {
    final post = Post(id: 1, userId: 1, title: 'title', body: 'body');

    when(getPostsUseCase(any)).thenAnswer((_) async => Right([post]));

    await controller.getPosts();

    expect(controller.content.posts.length, 1);
  });
}
