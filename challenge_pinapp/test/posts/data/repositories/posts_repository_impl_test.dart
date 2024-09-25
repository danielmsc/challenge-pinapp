import 'package:challenge_pinapp/core/data/network/exceptions.dart';
import 'package:challenge_pinapp/core/domain/entities/failures.dart';
import 'package:challenge_pinapp/posts/data/data_sources/posts_data_source.dart';
import 'package:challenge_pinapp/posts/data/models/post_model.dart';
import 'package:challenge_pinapp/posts/data/repositories/posts_repository_impl.dart';
import 'package:challenge_pinapp/posts/domain/entities/post.dart';
import 'package:challenge_pinapp/posts/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'posts_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<PostsDataSource>()])
void main() async {
  late MockPostsDataSource dataSource;
  late PostsRepository repository;

  setUp(() {
    dataSource = MockPostsDataSource();
    repository = PostsRepositoryImpl(dataSource: dataSource);
  });

  test('Should return a Right<List<Post>>', () async {
    final post = PostModel(
      userId: 1,
      id: 1,
      title: 'title',
      body: 'body',
    );

    when(dataSource.getPosts()).thenAnswer((_) async => [post]);

    final result = await repository.getPosts();

    expect(result, isA<Right<Failure, List<Post>>>());

    result.fold((_) => null, (posts) => expect(posts[0].id, 1));
  });

  test('Should return a Failure', () async {
    when(dataSource.getPosts()).thenThrow(NetworkException());

    final result = await repository.getPosts();

    expect(result, isA<Left<Failure, List<Post>>>());
  });
}
