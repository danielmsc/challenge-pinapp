import 'package:challenge_pinapp/core/domain/entities/failures.dart';
import 'package:challenge_pinapp/posts/domain/entities/post.dart';
import 'package:challenge_pinapp/posts/domain/repositories/posts_repository.dart';
import 'package:challenge_pinapp/posts/domain/use_cases/get_posts.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_posts_test.mocks.dart';

@GenerateNiceMocks([MockSpec<PostsRepository>()])
void main() {
  late PostsRepository repository;
  late GetPosts getPostsUseCase;

  setUp(() {
    repository = MockPostsRepository();
    getPostsUseCase = GetPosts(repository: repository);
  });

  test('Should return a list of posts (Right)', () async {
    final post = Post(
      userId: 1,
      id: 1,
      title: 'title',
      body: 'body',
    );

    when(repository.getPosts()).thenAnswer((_) async => Right([post]));

    final result = await getPostsUseCase(NoParamsGetPosts());

    expect(result, isA<Right<Failure, List<Post>>>());
  });

  test('Should return a Failure (Left)', () async {
    when(repository.getPosts()).thenAnswer((_) async => Left(NetworkFailure()));

    final result = await getPostsUseCase(NoParamsGetPosts());

    expect(result, isA<Left<Failure, List<Post>>>());
  });
}
